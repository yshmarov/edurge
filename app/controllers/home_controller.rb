class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def index
    @latest_courses = Course.all.published.approved.order(created_at: :desc).limit(3)
    @popular_categories = Category.all.order(courses_count: :desc).limit(3)
  end
end
