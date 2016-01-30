class AdminSessionsController < ApplicationController
  before_action :set_referer, only: [:new]

  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_to(session.delete(:return_to), notice: "Logged in successfully")
    else
      flash.now.alert = "Login failed"
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: "Logged out!")
  end
end
