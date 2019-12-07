class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def approve?
    @user.has_role?(:admin)
  end
  
  def show?
    @record.published && @record.approved || @user.present? && @user.has_role?(:admin) || @user.present? && @record.user_id == @user.id
  end

  def create?
    @user.has_role?(:teacher)
  end

  def new?
    @user.has_role?(:teacher)
  end

  def update?
    @record.user_id == @user.id
    #@user.has_role?(:admin) || @record.user_id == @user.id
  end

  def edit?
    @record.user_id == @user.id
  end

  def destroy?
    @user.has_role?(:admin) || @record.user_id == @user.id
  end

end
