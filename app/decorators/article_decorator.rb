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
    "Author: #{user.name}. Created: #{formated_created_at}"
  end

  def formatted_view_count
    "Views: #{views_count}"
  end

  def html_body
    h.raw(text)
  end
end
