class Course < ApplicationRecord
  belongs_to :user
  belongs_to :category, counter_cache: true
  has_many :lessons, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses

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

  #def average_rating2
  #  user_courses.blank? ? 0 : user_courses.average(:rating).round(2)
  #end

  def update_rating
    update_column :average_rating, (user_courses.where.not(rating: nil).average(:rating).round(2).to_f)
  end

end
