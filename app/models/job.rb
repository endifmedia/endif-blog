class Job < ApplicationRecord
  has_one_attached :featured_image
  belongs_to :user
  has_rich_text :content

  validates :user_id, presence: true
end