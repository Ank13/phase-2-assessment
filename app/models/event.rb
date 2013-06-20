class Event < ActiveRecord::Base

  #users who attend the event:
  has_many :event_attendances
  # has_many :users, :through => :event_attendances

  # user who creates the event:
  # belongs_to :user  

end
