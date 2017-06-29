class CategoriesController < ApplicationController
  def show
    @q = Category.find(params[:id]).articles.ransack(params[:q])
    @articles = @q.result.order(:created_at).page params[:page]
    render 'articles/index'
  end
end
