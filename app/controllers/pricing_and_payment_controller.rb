class PricingAndPaymentController < ApplicationController

  def index
  end

  def add_funds
    if !user_signed_in?
      redirect_to '/account/login_prompt'
    else
      #current_user.balance+=funds
      @newBalance = current_user.balance + params[:funds].to_f
      current_user.update_attribute(:balance, @newBalance)
      flash[:notice] = "Successfully added funds."
      redirect_to action: 'index'
    end
  end

end