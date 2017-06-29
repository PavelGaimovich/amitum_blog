class ArticlesController < ApplicationController
  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result.order(:created_at).page params[:page]
  end

  def show
    @article = Article.find(params[:id])
    @article.register_view
  end
end
