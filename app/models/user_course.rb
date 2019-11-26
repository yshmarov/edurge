class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course, counter_cache: true

  validates :user, :course, presence: true
  #validates :rating, :comment, :user, :course, presence: true
  #validates_presence_of :rating, :if => :comment?
  #validates_presence_of :rating, if: :comment?

  #validates_uniqueness_of :user_id, scope: :course_id
  #validates_uniqueness_of :course_id, scope: :user_id
  #user can't create a user_course if course.user == current_user.id

  after_save do
    course.update_rating
  end 
end
