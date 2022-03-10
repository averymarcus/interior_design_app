class Comment < ApplicationRecord
  # Direct associations

  belongs_to :furniture_post,
             :class_name => "Furniture",
             :foreign_key => "furniture_id"

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    furniture_post.to_s
  end

end
