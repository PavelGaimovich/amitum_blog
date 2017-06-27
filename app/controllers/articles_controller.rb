class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(:created_at).page params[:page]
  end

  def show
    @article = Article.find(params[:id])
    @article.register_view
  end
end
