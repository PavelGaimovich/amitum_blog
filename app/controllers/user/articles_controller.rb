class User::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @user_articles = current_user.articles.order(:created_at).page params[:page]
  end

  def new
    @user_article = Article.new
  end

  def create
    @user_article = Article.create(article_params)
  end

  def update
    @user_article.update(article_params)
  end

  def destroy
    @user_article.destroy
  end

  private

  def set_article
    @user_article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :user_id)
  end
end
