class Category < ApplicationRecord
  has_many :courses, dependent: :restrict_with_error

  validates :name, :description, presence: true

  def to_s
    name
  end

  extend FriendlyId
  friendly_id :name, use: :slugged
end
