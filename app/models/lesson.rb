class Lesson < ApplicationRecord
  belongs_to :course, counter_cache: true
  has_many :user_lessons, dependent: :nullify

  validates :name, :description, :course, presence: true

  include RankedModel
  ranks :row_order, :with_same => :course_id

  def to_s
    name
  end
  
  def embed_url
    self.video_url.gsub!('watch?v=','embed/')
  end

  extend FriendlyId
  friendly_id :name, use: :slugged

  def prev
    course.lessons.where("row_order < ?", row_order).order(:row_order).last
  end

  def next
    course.lessons.where("row_order > ?", row_order).order(:row_order).first
  end

  def viewed(user)
    self.user_lessons.where(user_id: [user.id], lesson_id: [self.id]).empty?
  end

end
