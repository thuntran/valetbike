class PricingAndPaymentController < ApplicationController
  def index
    @stations = Station.all.order(identifier: :asc)
    @bikes = Bike.all.order(identifier: :asc)

    if params[:station]
      @chosenStation = Station.find_by(address: params[:station])
      @theseBikes = @chosenStation.docked_bikes
    end

    if params[:bike]
      @chosenBike = Bike.find_by(identifier: params[:bike])
      @chosenStation = @chosenBike.current_station
      @theseBikes = @chosenStation.docked_bikes
    end
  end

  def ride
    #@bike = Bike.find_by(identifier: params[:bike])
  end
end