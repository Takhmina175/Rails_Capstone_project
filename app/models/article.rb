class Article < ApplicationRecord
  belongs_to :user, foreign_key: :author_id 
  has_many :votes 
  has_one_attached :image
  has_many :articles_category_lists 
  has_many :categories, through: :articles_category_lists 
  

  validates :title, presence: true
  validates :image, presence: true
  validates :content, presence: true, length: { maximum: 150 }

  scope :ordered_by_most_recent, -> { order(created_at: :desc) } 

  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
