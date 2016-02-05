class User < ActiveRecord::Base
  # before_save { self.email = email.downcase }

  validates :first_name, :last_name, {presence: true, length: { maximum: 50 }}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }}
  has_secure_password
  validates :password, {presence: true, length: { minimum: 6 }}

  has_many :yoga_sessions
  has_many :yoga_classes, through: :yoga_sessions
  
  def registered_upcoming_yoga_classes
    yoga_classes.order(date: :desc).where('date >= ?', Date.today)
  end
end
