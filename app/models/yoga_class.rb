class YogaClass < ActiveRecord::Base
  validates :date, presence: true
  validates :size, presence: true

  has_many :yoga_sessions
  has_many :users, through: :yoga_sessions
end
