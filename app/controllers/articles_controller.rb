class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(:created_at).page params[:page]
  end

  def new
    @article = Article.new
  end
end
