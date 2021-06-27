class Category < ApplicationRecord
  has_many :articles_category_lists, foreign_key: 'category_id'
  has_many :articles, through: :articles_category_lists, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
