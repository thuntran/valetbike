class RidesController < ApplicationController
  
    def index
      @stations = Station.all.order(identifier: :asc)
      @bikes = Bike.all.order(identifier: :asc)

    end
    def show
        @bike = Bike.find(params[:id])
        render 'pricing_and_payment/ride'
    end
  end