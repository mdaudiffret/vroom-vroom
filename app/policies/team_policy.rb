class TeamPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    true
  end

  def join_championship?
    record.user == user
  end

  def show?
    record.user == user
  end

  def update?
    show?
  end
end
