class User < ActiveRecord::Base

  has_secure_password

  self.primary_key = [:mobile_number, :first_name]

  has_many :tasks

  scope :sorted, lambda { order("users.last_name") }
  scope :search, lambda { |query|
    where(["first_name LIKE ?", "%#{query}%"]) } #wildcard search

  EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

  validates :mobile_number, :presence => true, :length => {:maximum => 25}
  validates :first_name, :presence => true, :length => {:minimum => 2, :message => 'min 2 chars'}
  #validates :email,  :format => {:with => EMAIL_REGEX, :message => 'needs to be valid email'}
  validates :password,  :length => {:minimum => 1, :message => "min 5 chars"}
  validates :password_confirmation, :presence => {:message => 'please confirm password'}


end
