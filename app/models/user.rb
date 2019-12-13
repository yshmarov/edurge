class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

  has_many :courses, dependent: :nullify
  has_many :subscriptions, dependent: :nullify
  has_many :user_lessons, dependent: :nullify

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

  after_create :assign_default_role

  def assign_default_role
    if User.count == 1
      self.add_role(:admin) if self.roles.blank?
      self.add_role(:teacher)
      self.add_role(:student)
    else
      self.add_role(:student) if self.roles.blank?
      self.add_role(:teacher) #if you want any user to be able to create own courses
    end
  end

  def buy_course(course)
    self.subscriptions.create(course: course, price: course.price)
  end

  def view_lesson(lesson)
    unless self.user_lessons.where(lesson: lesson).any?
      self.user_lessons.create(lesson: lesson)
    end
  end
end