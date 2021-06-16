class Article < ApplicationRecord 
    belongs_to :author, class_name: 'User'
    has_one_attached :image

    has_many :votes
    has_many :articles_category_lists 
    has_many :categories, :through => :articles_category_lists 

validates :image, content_type: {in: %w[image/jpeg image/gif image/png], message: "must be a valid image format"}, size: {less_than: 5.megabytes, message: "should be less than 5MB"}

end
