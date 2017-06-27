class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all.order(:created_at).page params[:page]
  end

  def show
    @article
  end

  def new
    @article = Article.new
  end

  def edit
    @article
  end

  def create
    @article = Article.create(article_params)
    render 'show'
  end

  def update
    @article.update(article_params)
  end

  def destroy
    @article.destroy
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :user_id)
  end
end
