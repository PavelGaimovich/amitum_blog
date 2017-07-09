class User::ArticlesController < ApplicationController
  load_and_authorize_resource

  def index
    @articles = current_user.articles.order(:created_at).page params[:page]
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to user_article_path(@article)
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to user_articles_path
  end

  private

  def find_article_and_decorate
    @article = Article.find(params[:id]).decorate
  end

  def article_params
    params.require(:article).permit(:title, :text, :user_id, :all_categories, :article_picture)
  end
end
