class ReviewPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def index?
      true
    end

    def show?
      index?
    end

    def create?
      index?
    end
  end

  def edit?
    user_is_author?
  end

  def update?
    user_is_author?
  end

  def destroy?
    user_is_author?
  end

  private

  def user_is_author?
    record.user_id == user.id
  end
end