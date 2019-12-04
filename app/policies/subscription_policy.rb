class SubscriptionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    @user.has_role?(:admin)
  end

  def update?
    #@user.has_role?(:admin) || @record.user_id == @user.id #admin can moderate/edit reviews
    @record.user_id == @user.id #admin can not moderate/edit reviews
  end

  def edit?
    #@user.has_role?(:admin) || @record.user_id == @user.id #admin can moderate/edit reviews
    @record.user_id == @user.id #admin can not moderate/edit reviews
  end

  def destroy?
    @user.has_role?(:admin)
  end
end
