class AccountController < ApplicationController
  def index

    if !user_signed_in?
      redirect_to '/account/login_prompt'
    end
    
   # @userRides = Ride.where(user_id == current_user.id)
  end
end
