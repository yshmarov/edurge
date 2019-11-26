class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course, counter_cache: true

  validates :rating, :comment, :user, :course, presence: true

  after_save do
    course.update_rating
  end 
end
