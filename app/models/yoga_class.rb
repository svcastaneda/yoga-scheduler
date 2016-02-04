class YogaClass < ActiveRecord::Base
  validates :date, presence: true
  validates :size, presence: true

  has_many :sessions
  has_many :users, through: :sessions
end
