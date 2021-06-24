class CategoriesController < ApplicationController 
    def index 
        @categories = Category.all
    end
    def show 
      @category= Category.find_by(params[:id])
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
        @article = Article.find_by(params[:id => :author_id])
        ArticlesCategoryList.breakup(@category, @article)
        redirect_to articles_path, notice: "Category deleted!"
    end

    private 

    def category_params
        params.require(:category).permit(:name, :priority) 
    end
end
