class Ride < ApplicationRecord
    #add validations
    validates_presence_of   :start_station_id,
                            :end_station_id,
                            :user_id,
                            :bike_id,
                            :start_time,
                            :end_time
    #validates_uniqueness_of :identifier

    belongs_to :user, class_name: :User, foreign_key: :user_id
    belongs_to :bike, class_name: :Bike, foreign_key: :bike_id
    belongs_to :start_station, class_name: :Station, foreign_key: :start_station_id
    belongs_to :end_station, class_name: :Station, foreign_key: :end_station_id

    belongs_to :current_station, class_name: :Station, foreign_key: :current_station_id

end
