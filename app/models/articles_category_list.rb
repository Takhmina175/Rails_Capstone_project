class ArticlesCategoryList < ApplicationRecord
  belongs_to :article, dependent: :destroy
  belongs_to :category, dependent: :destroy 

  def self.breakup(category_id, article_id)
    ArticlesCategoryList.find_by_category_id_and_article_id(category_id, article_id).destroy
  end
end
