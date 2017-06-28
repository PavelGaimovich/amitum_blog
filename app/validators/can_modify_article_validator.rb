class CanModifyArticleValidator < ActiveModel::Validator
  def validate(record)
    unless record.can_modify?
      record.errors[:base] << "Article can be changed only in first hour"
    end
  end
end
