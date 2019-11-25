class Post < ApplicationRecord
  has_one_attached :featured_image
  belongs_to :user
  has_rich_text :content
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :user_id, presence: true
end
