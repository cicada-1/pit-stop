class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def index?
    true
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def create?
    return true
  end

  def update?
    record.users.include?(user)
  end

  def destroy?
    record.users.include?(user)
  end
end
