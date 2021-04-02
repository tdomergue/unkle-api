class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    current_user.admin
  end

  def show?
    current_user.admin || current_user == record
  end

  def create?
    current_user.admin
  end

  def delete?
    current_user.admin
  end
end
