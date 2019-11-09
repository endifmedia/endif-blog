class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  validates :user_id, presence: true
end
