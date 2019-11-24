class Category < ApplicationRecord
  has_many :courses, dependent: :restrict_with_error
  def to_s
    name
  end
end
