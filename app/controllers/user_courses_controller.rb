class UserCoursesController < ApplicationController
  before_action :set_user_course, only: [:show, :edit, :update, :destroy]

  def index
    @user_courses = UserCourse.all
  end

  def show
  end

  def new
    @user_course = UserCourse.new
  end

  def edit
  end

  def create
    @user_course = UserCourse.new(user_course_params)

    respond_to do |format|
      if @user_course.save
        format.html { redirect_to @user_course, notice: 'User course was successfully created.' }
        format.json { render :show, status: :created, location: @user_course }
      else
        format.html { render :new }
        format.json { render json: @user_course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_course.update(user_course_params)
        format.html { redirect_to @user_course, notice: 'User course was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_course }
      else
        format.html { render :edit }
        format.json { render json: @user_course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_course.destroy
    respond_to do |format|
      format.html { redirect_to user_courses_url, notice: 'User course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user_course
      @user_course = UserCourse.find(params[:id])
    end

    def user_course_params
      params.require(:user_course).permit(:rating, :comment, :user_id, :course_id)
    end
end
