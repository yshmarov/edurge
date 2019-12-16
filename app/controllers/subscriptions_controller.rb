class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy, :remove_review]
  before_action :set_course, only: [:new, :create]

  def index
    @subscriptions = Subscription.all.order(created_at: :desc)
    authorize @subscriptions
  end
  
  def my_students
    @subscriptions = Subscription.joins(:course).where(courses: {user: current_user}).order(created_at: :desc)
    #authorize @subscriptions, :mine?
    render 'index'
  end

  def remove_review
    authorize @subscription, :edit?
		@subscription.update_attributes(rating: nil, comment: nil)
		@subscription.course.update_rating
		redirect_to @subscription.course, alert: "Review removed"
  end

  def show
  end

  def new
    #@subscription = Subscription.new
  end

  def edit
    authorize @subscription
  end

  def create
    if @course.price > 0
      flash[:alert] = "You can not access paid courses yet."
      redirect_to new_course_subscription_path(@course)
    else
      @subscription = current_user.buy_course(@course)
      redirect_to course_path(@course), notice: 'You bought the course!'
    end

    #@subscription = current_user.buy_course(@course)
    #respond_to do |format|
    #  format.html {redirect_to course_path(@course), notice: 'You bought the course!'}
    #end

    #@subscription = Subscription.new(subscription_params)
    #respond_to do |format|
    #  if @subscription.save
    #    format.html { redirect_to @subscription.course, notice: 'Subscription was successfully created.' }
    #    #format.html { redirect_to subscriptions_url, notice: 'Subscription was successfully created.' }
    #    format.json { render :show, status: :created, location: @subscription }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @subscription.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  def update
    authorize @subscription
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to course_path(@subscription.course), notice: 'Review was successfully posted. Thank you!' }
        format.json { render :show, status: :ok, location: @subscription }
      else
        format.html { render :edit }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @subscription
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to subscriptions_url, notice: 'User course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    def set_course
      @course = Course.friendly.find(params[:course_id])
    end

    def subscription_params
      params.require(:subscription).permit(:rating, :comment)
    end
end
