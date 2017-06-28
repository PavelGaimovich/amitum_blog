class Category::MostPopularCategoriesQuery
  class << self
    delegate :call, to: :new
  end

  def initialize(relation = Category.all)
    @relation = relation
  end

  def call
    @relation
      .select(:name)
      .joins(:categorizings)
      .having('count(article_id) > 3')
      .group(:name)
      .order(:name)
  end
end
