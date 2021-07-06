class CategoriesController < ApplicationController
  def index
    @articles = Article.includes(:categories)
    @categories = Category.includes(:articles).order(:priority)
  end

  def show 
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to articles_path, notice: 'You created a category!'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @article = Article.find_by(params[id: :author_id])
    if ArticlesCategoryList.find_by_category_id_and_article_id(@user, @friend)
      ArticlesCategoryList.breakup(@category, @article)
    else
      @category.destroy
    end
    redirect_to articles_path, notice: 'Category deleted!'
  end

  private

  def category_params
    params.require(:category).permit(:name, :priority)
  end
end
