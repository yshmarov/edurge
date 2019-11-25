class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def index
    @latest_courses = Course.all.published.approved.order(created_at: :desc).limit(3)
    @top_rated_courses = Course.all.published.approved.order(average_rating: :desc, created_at: :desc).limit(3)
    @popular_courses = Course.all.published.approved.order(reviews_count: :desc, created_at: :desc).limit(3)
    @popular_categories = Category.all.order(courses_count: :desc).limit(3)
    @latest_good_reviews = Review.all.order(rating: :desc, created_at: :desc).limit(3)
  end
end
