class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course, counter_cache: true

  validates :rating, :comment, :user, :course, presence: true
  #validates_uniqueness_of :user_id, scope: :course_id
  #validates_uniqueness_of :course_id, scope: :user_id

  after_save do
    course.update_rating
  end 
end
