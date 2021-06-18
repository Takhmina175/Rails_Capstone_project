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
            redirect_to categories_path, notice: 'You created a category!'
        else
            render :new 
        end
    end 

    private 

    def category_params
        params.require(:category).permit(:name, :priority) 
    end
end
