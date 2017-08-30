# frozen_string_literal: true

class ExampleSerializer < ActiveModel::Serializer
  attributes :id, :text, :editable # :user
  #           WORST (do not do)------^^^^

  # belongs_to :user
  #             ^^^^----ACCEPTABLE (when BEST isn't an option)

  # BEST
  def editable
    scope == object.user
  end
end
