class Plant < ActiveRecord::Base
  validates :common_name, presence: true
  validates :botanical_name, uniqueness: true
end
