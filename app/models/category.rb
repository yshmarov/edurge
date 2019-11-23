class Category < ApplicationRecord
  has_many :courses
  def to_s
    name
  end
end
