class AccountController < ApplicationController
  def index

    if !user_signed_in?
      redirect_to '/account/login_prompt'
    else
      @userRides = Ride.where(user_id: current_user.id).order(start_time: :desc).to_a
      @mostRecentRide = @userRides.first

      #if the user is currently on a ride, we need to make that info accessible 
      if @mostRecentRide.end_station_id.present?
        @currentlyRiding = false
      else
        @currentlyRiding = true
      end
    end
  end
end
