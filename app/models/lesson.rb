class Lesson < ApplicationRecord
  belongs_to :course, counter_cache: true

  validates :name, :description, :course, :seq_number, presence: true
  validates_uniqueness_of :seq_number, scope: :course_id

  def to_s
    name
  end
  
  def embed_url
    self.video_url.gsub!('watch?v=','embed/')
  end

  extend FriendlyId
  friendly_id :name, use: :slugged

  def prev
    course.lessons.where("seq_number < ?", seq_number).order(:seq_number).last
  end

  def next
    course.lessons.where("seq_number > ?", seq_number).order(:seq_number).first
  end
end
