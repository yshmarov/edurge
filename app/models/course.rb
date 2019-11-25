class Course < ApplicationRecord
  belongs_to :user
  belongs_to :category, counter_cache: true
  has_many :lessons, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, :category, :short_description, :description, :language, :duration, :price, :user, presence: true

  def to_s
    name
  end

  scope :published, -> { where(published: true) }
  scope :approved, -> { where(approved: true) }
  scope :unpublished, -> { where(published: false) }
  scope :unapproved, -> { where(approved: false) }

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  def reviews_count
    reviews.count
  end

  def ratings_sum
    reviews.map(&:rating).sum
  end

  def total_rating
    ratings_sum.to_d / reviews_count.to_d
  end
end
