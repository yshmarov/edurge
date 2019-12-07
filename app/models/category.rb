class Category < ApplicationRecord
  has_many :courses, dependent: :restrict_with_error

  validates :name, :description, presence: true
  validates_uniqueness_of :name

  def to_s
    name
  end

  extend FriendlyId
  friendly_id :name, use: :slugged
end
