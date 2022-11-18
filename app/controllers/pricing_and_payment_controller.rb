class PricingAndPaymentController < ApplicationController
  
  @bike = Bike.find_by(identifier: 1234)

  def index
    @stations = Station.all.order(identifier: :asc)
    @bikes = Bike.all.order(identifier: :asc)

    if params[:station]
      @chosenStation = Station.find_by(name: params[:station])
      @theseBikes = @chosenStation.docked_bikes
    end

    if params[:bike]
      @chosenBike = Bike.find_by(identifier: params[:bike])
      @chosenStation = @chosenBike.current_station
      @theseBikes = @chosenStation.docked_bikes
    end
  end
end