class Bike < ApplicationRecord
  validates_presence_of    :identifier,
                           #:current_station_id, #bad
                           :battery_percentage
                           
  validates_uniqueness_of  :identifier
  
  belongs_to :current_station, class_name: :Station, foreign_key: :current_station, optional: true
  belongs_to :current_user, class_name: :User, foreign_key: :current_user_id, optional: true

  has_many :rides, class_name: :Ride, foreign_key: :bike_id

end
