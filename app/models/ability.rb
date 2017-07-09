class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :update, :destroy, :to => :modify

    can :manage, Article

    unless user.has_role?(:admin)
      cannot :modify, Article do |article|
        article.user != user || article.created_at < Time.now - 1.hour
      end
    end
  end
end
