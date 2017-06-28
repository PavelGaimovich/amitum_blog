class CanModifyArticleValidator < ActiveModel::Validator
  def validate(record)
    if record.modify_until < Time.now
      record.errors[:base] << "Article can be changed only in first hour"
    end
  end
end
