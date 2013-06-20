class User < ActiveRecord::Base
  # events the user attends:
  has_many :event_attendances
  has_many :attended_events, :through => :event_attendances, :source => :event

  # events the user creates:
  has_many :created_events, :class_name => "Event"



  attr_accessor :password

  before_save :encrypt_password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, presence: true


  def self.authenticate(email, password)
    return false if email.empty? || password.empty?
    return false unless user = User.find_by_email(email)
    BCrypt::Password.new(user.password) == password 
  end
      
  private

  def encrypt_password
    self.password_digest = BCrypt::Password.create(self.password)
  end

end
