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
    record.band_id == user.bands.ids
  end

  def confirm?
    record.room.user == user
  end

  def reject?
    confirm?
  end
end
