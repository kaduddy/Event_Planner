class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :discussions
  has_many :userEvents
  has_many :event_joined, through: :userEvents, source: :event
  validates :email, :f_name, :l_name, :password, :password_confirmation, :city, presence: true
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, :uniqueness => true, :format => { :with => email_regex}

end
