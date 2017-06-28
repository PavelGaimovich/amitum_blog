class CategoriesController < ApplicationController
  def show
    @articles = Category.find(params[:id]).articles.order(:created_at).page params[:page]
    render 'articles/index'
  end
end
