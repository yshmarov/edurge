class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :courses, dependent: :nullify
  has_many :subscriptions, dependent: :nullify

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
    if User.any?
      self.add_role(:student) if self.roles.blank?
    else
      self.add_role(:admin) if self.roles.blank?
    end
  end

  def buy_course(course)
    self.subscriptions.create(course: course)
  end
end