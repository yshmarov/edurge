class Task < ApplicationRecord
  belongs_to :course, counter_cache: true
  validates :chapter, presence: true
  def to_s
    name
  end
  
  def embed_url
    self.video_url.gsub!('watch?v=','embed/')
  end
end
