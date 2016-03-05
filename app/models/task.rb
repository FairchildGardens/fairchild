class Task < ActiveRecord::Base

  belongs_to :hunt

  has_many :user_tasks
  has_many :users, through: :user_tasks

end
