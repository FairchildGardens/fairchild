class Hunt < ActiveRecord::Base

  has_many :tasks
  belongs_to :user

  has_many :hunt_users
  has_many :users, through: :hunt_users

end
