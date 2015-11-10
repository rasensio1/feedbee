class Place < ActiveRecord::Base

  validates :place_id, :name, presence: true
end
