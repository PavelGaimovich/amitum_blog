class User::ArticlesController < ApplicationController
  before_action :require_current_user
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_permission, only: [:edit, :update, :destroy]

  def index
    @user_articles = current_user.articles.order(:created_at).page params[:page]
  end

  def new
    @user_article = Article.new
  end

  def create
    @user_article = Article.new(article_params)

    if @user_article.save
      redirect_to user_article_path(@user_article)
    else
      render 'new'
    end
  end

  def update
    if @user_article.update(article_params)
      redirect_to @user_article
    else
      render 'edit'
    end
  end

  def destroy
    @user_article.destroy
    redirect_to user_articles_path
  end

  private

  def set_article
    @user_article = Article.find(params[:id]).decorate
  end

  def article_params
    params.require(:article).permit(:title, :text, :user_id, :all_categories, :article_picture)
  end

  def require_permission
    redirect_to root_path if current_user != @user_article.user
  end

  def require_current_user
    redirect_to root_path if current_user.blank?
  end
end
