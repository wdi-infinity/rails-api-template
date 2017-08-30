#!/usr/bin/env ruby
# frozen_string_literal: true

infile_name = ARGV[0]
infile_name || abort('filename required')
outfile = $stdout

File.open infile_name do |markdown|
  in_code_block = false
  markdown.each do |line|
    if in_code_block
      in_code_block = (line !~ /<!-- end code block -->/)
      unless in_code_block
        outfile.write "```\n"
        outfile.write line
      end
    else
      outfile.write line
      in_code_block = line =~ /<!-- start code block .+ -->/
      if in_code_block
        filename = /.+ +file="(?<filename>.+)"/.match(line)[:filename]
        extension = File.extname(filename)[1..-1]
        outfile.write "```#{extension}\n"
        File.open filename do |file|
          file.each do |code|
            outfile.write code
          end
        end
      end
    end
  end
end
