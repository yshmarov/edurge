class Review < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :rating, :comment, :user, :course, presence: true
end
