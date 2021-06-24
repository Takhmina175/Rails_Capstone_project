class ArticlesController < ApplicationController 
  before_action :authenticate_user!
  
  def index 
    @articles = Article.all 
    recent_art 
  end

  def show 
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end 

  def create
    @category = Category.find_by(params[:id])
    @article = current_user.articles.build(article_params)
    @article.image.attach(params[:article][:image])
    if @article.save
    ArticlesCategoryList.create(article_id: @article.id, category_id: @category.id)
      redirect_to articles_path, notice: "Article created!"
      recent_art
    else
      render :new  
    end
  end 

  def edit 
    @article = Article.find(params[:id])
  end 

  def update
    @article = Article.find(params[:id])
    @category = @article.categories
    if @article.update(article_params)
      redirect_to articles_path, notice: "Article updated!"
    else 
      render :edit 
    end
  end 

  def destroy 
    @article = Article.find_by(params[:id => :author_id])
    @article.destroy
    redirect_to articles_path, notice: "Article deleted!"
  end 

  def recent_art
    @recent_art ||= Article.all.ordered_by_most_recent.includes(:author)
  end
  private 

  def article_params 
    params.require(:article).permit(:title, :content, :image, :category)
  end
end
