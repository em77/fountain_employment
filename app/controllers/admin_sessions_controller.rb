class AdminSessionsController < ApplicationController

  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(listings_path, notice: "Logged in successfully")
    else
      flash.now.alert = "Login failed"
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(listings_path, notice: "Logged out!")
  end
end
