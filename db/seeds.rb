# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).

require 'aws-sdk-s3'

s3 = Aws::S3::Resource.new(
  region: 'us-east-1',
  access_key_id: ENV['S3_ACCESS_KEY_ID'],
  secret_access_key: ENV['S3_SECRET_ACCESS_KEY']
)

image_data = []
row_labels = 'artist_first_name artist_middle_name artist_last_name ' \
             'photographer_first_name photographer_last_name medium'.split

Dir.foreach('./db/data/images') do |dir|
  next if ['.', '..', '.DS_Store'].include?(dir)
  clean_row = dir.gsub(/[()]/, ')' => '', '(' => '')

  data = []
  artist_info, photo_info = clean_row.split('by').map(&:strip)
  if artist_info.split.length == 2
    data << artist_info.split[0]
    data << ''
    data << artist_info.split[1]
  else
    data.push(*artist_info.split)
  end
  data.push(*photo_info.split)
  image_data << Hash[row_labels.zip(data)]
end
puts 'generated data from files'

puts
puts

user_types = %w[artist admin]

user_types.each do |name|
  puts "making UserType #{name}"
  UserType.create(name: name)
end

puts
puts

user_type_artist_id = UserType.find_by_name('artist').id
image_data.each do |row|
  puts "making User #{row['artist_first_name']} #{row['artist_last_name']}"
  user = User.new(
    first_name: row['artist_first_name'],
    middle_name: row['artist_middle_name'],
    last_name: row['artist_last_name'],
    email: "#{row['artist_first_name']}#{row['artist_last_name']}@gmail.com",
    password: "SOVO#{row['artist_first_name']}",
    password_confirmation: "SOVO#{row['artist_first_name']}",
    user_types_id: user_type_artist_id,
    change_pw: false
  )
  user.save!
  puts "making Album 'SOVO// Magazine Issue 3' for " \
       "#{row['artist_first_name']} #{row['artist_last_name']}"

  Album.create!(
    name: 'Issue 3 Editorial',
    information: '',
    user_id: user.id
  )
end

puts
puts

photogs_rows = image_data.uniq do |x|
  x['photographer_first_name'] + x['photographer_last_name']
end

photogs_rows.each do |row|
  puts "making Photographer #{row['photographer_first_name']} " \
       "#{row['photographer_last_name']}"
  Photographer.create!(
    first_name: row['photographer_first_name'],
    middle_name: row['photographer_middle_name'],
    last_name: row['photographer_last_name']
  )
end

puts
puts

index = -1
Dir.foreach('db/data/images') do |dir|
  next if ['.', '..', '.DS_Store'].include?(dir)
  index += 1

  Dir.foreach("db/data/images/#{dir}") do |file|
    next if ['.', '..', '.DS_Store'].include?(file)
    puts "uploading db/data/images/#{dir}/#{file} to s3"
    obj = s3.bucket(ENV['S3_BUCKET_NAME']).object("Issue_3/#{file}")
    obj.upload_file("db/data/images/#{dir}/#{file}")

    puts "making Image db/data/images/#{dir}/#{file}"
    image = Image.new(
      url: "https://s3.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/Issue_3/#{file}",
      photographer_id: Photographer.find_by(
        first_name: image_data[index]['photographer_first_name'],
        last_name: image_data[index]['photographer_last_name']
      ).id
    )
    image.save!

    puts 'adding Image to AlbumImages'
    AlbumImage.create!(
      image_id: image.id,
      album_id: Album.find_by(user_id: User.find_by(
        first_name: image_data[index]['artist_first_name'],
        last_name: image_data[index]['artist_last_name']
      ).id).id
    )
  end
end
