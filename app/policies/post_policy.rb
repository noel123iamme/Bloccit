class PostPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.present? 
        if (user.admin? || user.moderator?)
          scope.all
        else
          scope.where(:user => user)
        end
      else
        scope
      end
    end
  end

  def index?
    user.present? 
  end

  def destroy?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end
end

