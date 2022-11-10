class PricingAndPaymentController < ApplicationController
  def index
    @stations = Station.all.order(identifier: :asc)

    if params[:selected_station]
      @bikes = Bike.all.order(identifier: :asc)
    end
  end
end