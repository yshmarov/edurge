class Course < ApplicationRecord
  belongs_to :user
  belongs_to :category, counter_cache: true
  has_many :lessons, dependent: :destroy
  validates :name, :category, :short_description, :description, :language, :duration, :price, :user, presence: true
  def to_s
    name
  end
  scope :published, -> { where(published: true) }
  scope :approved, -> { where(approved: true) }
  scope :unpublished, -> { where(published: false) }
  scope :unapproved, -> { where(approved: false) }
end
