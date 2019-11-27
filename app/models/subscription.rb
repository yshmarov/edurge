class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :course, counter_cache: true

  validates :user, :course, presence: true

  validates_presence_of :rating, if: :comment?
  validates_presence_of :comment, if: :rating?

  #validates_uniqueness_of :user_id, scope: :course_id
  #validates_uniqueness_of :course_id, scope: :user_id
  #user can't create a subscription if course.user == current_user.id

  scope :pending_review, -> { where(rating: [0, nil, ""], comment: [nil, ""]) }
  scope :rated, -> { where.not(comment: [nil, ""]) }

  after_save do
    unless rating.nil? || rating.zero?
      course.update_rating
    end 
  end 
end
