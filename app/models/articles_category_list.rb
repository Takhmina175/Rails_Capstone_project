class ArticlesCategoryList < ApplicationRecord
  belongs_to :article
  belongs_to :category
end
