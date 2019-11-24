class Course < ApplicationRecord
  belongs_to :user
  belongs_to :category, counter_cache: true
  has_many :tasks, dependent: :destroy
  validates :name, :description, :category, :user, presence: true
  def to_s
    name
  end
end
