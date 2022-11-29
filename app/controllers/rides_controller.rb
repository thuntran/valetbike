class RidesController < ApplicationController
  
  #before_action :update

    def index
    end

    def update
      @bike = Bike.find_by(identifier: params[:id])
      #@bike.update_attribute(:current_station, Station.find(2))

      if @bike.current_station
        @ride = Ride.new
        @ride.update_attribute(:start_station_id, @bike.current_station.id)
        @ride.update_attribute(:bike_id, @bike.id)
        @ride.update_attribute(:user_id, current_user.id)
        @ride.update_attribute(:start_time, DateTime.now)


        @bike.update_attribute(:current_station, nil)
        @bike.update_attribute(:current_user_id, current_user.id)
      else
        @ride = Ride.find_by(bike_id: @bike.id, user_id: current_user.id)
      end
    end

    def edit
      @ride = Ride.find(params[:id])
      @bike = Bike.find(@ride.bike_id)
      @stations = Station.all.order(identifier: :asc)

      if params[:station] && !@ride.end_station_id
        @chosenStation = Station.find_by(name: params[:station])
        @ride.update_attribute(:end_station_id, @chosenStation.id)
        @ride.update_attribute(:end_time, DateTime.now)

        @bike.update_attribute(:current_station, @chosenStation)
        @bike.update_attribute(:current_user_id, nil)
      end
      render 'pricing_and_payment/endride'
    end


    def show
        update 
        render 'pricing_and_payment/ride'
    end
  end