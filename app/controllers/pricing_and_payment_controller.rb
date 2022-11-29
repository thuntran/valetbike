class PricingAndPaymentController < ApplicationController
  
  @bike = Bike.find_by(identifier: 1234)

  def index
    @stations = Station.all.order(identifier: :asc)
    @bikes = Bike.all.order(identifier: :asc)

    if !user_signed_in?
      redirect_to '/account/login_prompt'
    end

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