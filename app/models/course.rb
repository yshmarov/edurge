class Course < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :category, counter_cache: true
  has_many :lessons, dependent: :destroy
  has_many :subscriptions, dependent: :restrict_with_error
  has_many :user_lessons, through: :lessons

  validates :name, :category, :short_description, :description, :language, :duration, :price, :user, presence: true
  validates_uniqueness_of :name

  def to_s
    name
  end

  scope :published, -> { where(published: true) }
  scope :approved, -> { where(approved: true) }
  scope :unpublished, -> { where(published: false) }
  scope :unapproved, -> { where(approved: false) }

  validates :level, inclusion: %w(beginner intermediate advanced)

  extend FriendlyId
  friendly_id :name, use: :slugged

  def update_rating
    if subscriptions.any? && subscriptions.where.not(rating: nil).any?
      update_column :average_rating, (subscriptions.average(:rating).round(2).to_f)
    else
      update_column :average_rating, (0)
    end
  end

  def bought(user)
    self.subscriptions.where(user_id: [user.id], course_id: [self.id]).empty?
  end

  def progress(user)
    user_lessons.where(user: user).count/lessons_count.to_f*100
  end
end
