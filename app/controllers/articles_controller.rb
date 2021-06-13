class ArticlesController < ApplicationController 
  before_action :authenticate_user!
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
    @article = current_user.articles.build(article_params)
    @article.image.attach(params[:article][:image])
    if @article.save
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
    if @article.update(article_params)
      redirect_to articles_path, notice: "Article updated successful!"
    else 
      render :edit 
    end
  end 

  def destroy 
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path, notice: "Article deleted"
  end 

  private 
   def article_params 
     params.require(:article).permit(:title, :content, :image)
   end
end
