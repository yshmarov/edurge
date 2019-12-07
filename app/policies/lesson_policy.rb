class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    @record.course.bought(@user) == false || @user.has_role?(:admin) || @record.course.user_id == @user.id #admin needs to validate lesson quality
    #@record.course.bought(@user) == false || @record.course.user_id == @user.id
  end

  def update?
    @record.course.user_id == @user.id
    #@user.has_role?(:admin) || @record.course.user_id == @user.id
  end

  def edit?
    @record.course.user_id == @user.id
  end

  def destroy?
    @record.course.user_id == @user.id
  end

end
