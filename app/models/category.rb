class Category < ApplicationRecord 
    has_many :articles_category_lists 
    has_many :articles, :through => :articles_category_lists, dependent: :destroy

    validates :name, :priority, presence: true 
    validates :name, uniqueness: true 
end
