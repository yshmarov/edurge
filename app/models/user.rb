class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :courses, dependent: :nullify
  has_many :subscriptions, dependent: :nullify
  #has_many :courses, through: :subscriptions

  extend FriendlyId
  friendly_id :email, use: :slugged

  def username
    if email.present?
      self.email.split(/@/).first
    end
  end
  
  def to_s
    username
  end

  def buy_course(course)
    self.subscriptions.create(course: course)
  end
end