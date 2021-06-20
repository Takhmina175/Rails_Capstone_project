class ArticlesController < ApplicationController 
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index 
    @articles = Article.all
  end

  def show 
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end 

  def create
    @category = Category.find_by(params[:id])
    @article = @current_user.articles.build(article_params)
    @article.image.attach(params[:article][:image])
    if @article.save
       @category.articles << @article
       @category.save
       redirect_to articles_path, notice: "Article created!"
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

  private 

  def set_article
    @article = Article.find(params[:id])
  end

   def article_params 
     params.require(:article).permit(:title, :content, :image, :category)
   end

end
