class Course < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :tasks
  def to_s
    name
  end
end
