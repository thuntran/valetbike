class AccountController < ApplicationController
  def index

    if !user_signed_in?
      redirect_to '/account/login_prompt'
    else
      @userRides = Ride.where(user_id: current_user.id).order(start_time: :desc).to_a
      if @userRides.present?
        @mostRecentRide = @userRides.first
      end

      #if the user is currently on a ride, we need to make that info accessible 
      if @mostRecentRide.present? && !@mostRecentRide.end_station_id.present?
        @currentlyRiding = true
      else
        @currentlyRiding = false
      end
    end
  end
end
