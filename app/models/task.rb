class Task < ActiveRecord::Base

  belongs_to :hunt

  has_many :user_tasks
  has_many :users, through: :user_tasks

  def self.hunt_options
    hunts = []
    Hunt.find_each do |hunt|
      hunts << [hunt.name, hunt.id]
    end
    hunts
  end

  def self.claim_types
    ["plant code", "image match", "QR"]
  end

end
