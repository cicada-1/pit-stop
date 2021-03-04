class RoomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view a room
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def create?
    true # Anyone can create a room
  end

  def update?
    record.users.include?(user)  # Only room creator can update it
  end

  def destroy?
    record.users.include?(user)  # Only room creator can update it
  end
end
