class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        @categories = Category.all
    end

    def show
        @category = Category.find(params[:id])
        @articles = Article.where(category_id: [@category])
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)

        if @category.save
            redirect_to categories_path
        else
            render :new
        end
    end

    def edit 
        @category = Category.find(params[:id])
    end 

    def update
        @category = Category.find(params[:id])

        if @category.update(category_params)
            redirect_to @category
        else
            render :edit
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @articles = Article.where(category_id: [@category])
        @articles.each do |article|
            article.category_id = nil
            article.save
        end

        @category.destroy
        redirect_to categories_path
    end

    private
        def set_category
            @category = Category.find(params[:id])
        end

        def category_params
            params.require(:category).permit(:name)
        end
end