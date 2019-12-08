class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.has_role?(:admin)
      @lessons = Lesson.rank(:row_order)
    else
      redirect_to root_path, alert: 'You are not authorized to view the page.'
    end
  end

  def sort
    lesson = Lesson.friendly.find(params[:lesson_id])
    lesson.update(lesson_params)
    #render nothing: true
    render body: nil #from rails5 tutorial

    #@course = Course.friendly.find(params[:course_id])
    #@lesson = Lesson.find(lesson_params[:lesson_id])
    #@lesson.row_order_position = lesson_params[:row_order_position]
    #@lesson.save
  end

  def show
    authorize @lesson, :show?
    current_user.view_lesson(@lesson)
    #current_user.user_lessons.create(lesson: lesson)
    #current_user.user_lessons.create(@lesson)
  end

  def new
    @course = Course.friendly.find(params[:course_id])
    @lesson = Lesson.new
  end

  def edit
    authorize @lesson
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @course = Course.friendly.find(params[:course_id])
    @lesson.course_id = @course.id

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to course_lesson_path(@course, @lesson), notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @lesson
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to course_lesson_path(@course, @lesson), notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to course_path(@course), notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_lesson
      @course = Course.friendly.find(params[:course_id])
      @lesson = Lesson.friendly.find(params[:id])
    end

    def lesson_params
      params.require(:lesson).permit(:name, :description, :video_url, :row_order_position)
    end
end
