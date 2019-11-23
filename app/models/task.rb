class Task < ApplicationRecord
  belongs_to :course
  def to_s
    name
  end
end
