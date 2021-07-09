class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_one_attached :image
  has_many :votes, dependent: :destroy
  has_many :articles_category_lists, foreign_key: 'article_id'
  has_many :categories, through: :articles_category_lists, dependent: :destroy

  validate :acceptable_image
  validates :title, :content, :image, presence: true
  validates :title, length: { maximum: 20 }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  def acceptable_image 
    return unless image.attached? 
    unless image_and_pod <= 1.megabyte 
      errors.add(:image, "is too big")
    end 
    acceptable_type = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, "must be a JPEG or PNG")
    end
  end

  def display_image
    image.variant(resize_to_limit: [780, 180])
  end
end
