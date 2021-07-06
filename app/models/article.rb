class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_one_attached :image
  has_many :votes, dependent: :destroy
  has_many :articles_category_lists, foreign_key: 'article_id'
  has_many :categories, through: :articles_category_lists, dependent: :destroy

  validates :image, content_type: {
    in: %w[image/jpeg image/gif
           image/png], message: 'must be a valid image format'
  }, size: { less_than: 5.megabytes, message: 'should be less than 5MB' }

  validates :title, :content, presence: true
  validates :title, length: { maximum: 20 }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  def display_image
    image.variant(resize_to_limit: [780, 180])
  end
end
