class AccountController < ApplicationController
  def index

    if !user_signed_in?
      redirect_to '/account/login_prompt'
    else
   @userRides = Ride.where(user_id: current_user.id).order(end_time: :desc)
    end
  end
end
