class Ride < ApplicationRecord
    #add validations
    validates_presence_of   :identifier,
                            :start_station,
                            :end_station,
                            :User,
                            :Bike,
                            :start_time,
                            :end_time,
    validates_uniqueness_of :identifier

    belongs_to :user
    has_one :bike
    has_many :stations

end
