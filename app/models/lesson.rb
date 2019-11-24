class Lesson < ApplicationRecord
  belongs_to :course, counter_cache: true

  validates :name, :description, :chapter, :course, :video_url, presence: true

  def to_s
    name
  end
  
  def embed_url
    self.video_url.gsub!('watch?v=','embed/')
  end

  extend FriendlyId
  friendly_id :name, use: :slugged
end
