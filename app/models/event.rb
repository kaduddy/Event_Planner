class Event < ActiveRecord::Base
  belongs_to :user
  has_many :discussions
  has_many :userEvents
  has_many :user_joined, through: :userEvents, source: :user
  validates :name, :date, :city, presence: true
end
