class ArticleDecorator < Draper::Decorator
  delegate_all

  def image70x70
    if article_picture.present?
      h.image_tag(article_picture.url, size: '70x70')
    end
  end

  def image_responsive
    if article_picture.present?
      h.image_tag(article_picture.url, class: 'img-responsive')
    end
  end

  def text_sample
     h.truncate(h.sanitize(text), length: 30)
  end

  def user_name
    user.name
  end

  def formated_created_at
    created_at.strftime('%F %H:%M')
  end

  def about_author_and_post
    h.t('articles.author_and_then_created', author: user.name, created_at: formated_created_at )
  end

  def formatted_view_count
    h.t('articles.formatted_view_count', views_count: views_count)
  end

  def html_body
    h.raw(text)
  end
end
