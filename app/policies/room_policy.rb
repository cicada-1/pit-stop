class RoomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view a room
  end

  def create?
    true # Anyone can create a room
  end

  def update?
    record.user == user  # Only room creator can update it
  end

  def destroy?
    record.user == user  # Only room creator can update it
  end
end
