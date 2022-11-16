class RidesController < ApplicationController
  
    def index
      @stations = Station.all.order(identifier: :asc)
      @bikes = Bike.all.order(identifier: :asc)

    end
    def show
        @bike = Bike.find(params[:id])
        #make sure user is signed
        @ride = Ride.new #Ride.create(start_station=@bike.current_station_id, bike=@bike.id, user=current_user.id, start_time=DateTime.now)
        @ride.start_station_id = @bike.current_station_id
        @ride.bike_id = @bike.id
        @ride.user_id = current_user.id
        @ride.start_time = DateTime.now
        @ride.save

        @bike.current_station_id = 0
        @bike.current_user_id = current_user.id


        render 'pricing_and_payment/ride'
    end
  end