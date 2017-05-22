class TwilioConfirmationController < ApplicationController

  def new

  end

  def create
    if current_user.is_valid_code?(params[:code_verification][:code])
      session[:authenticated] = true
    else
      flash.now[:failure] = "The code you entered was not valid."
      render :new
  end

end
