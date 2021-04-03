class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.admin
  end

  def show?
    user.admin || user == record
  end

  def create?
    user.admin
  end

  def delete?
    user.admin
  end
end
