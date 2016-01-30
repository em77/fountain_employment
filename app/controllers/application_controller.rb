class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def paginated(to_paginate, num_per_page = 25)
    to_paginate.paginate(page: params[:page], per_page: num_per_page)
  end

  def orderer(result, order_by, order_direction = "asc")
    if order_by == "company_id"
      result_ordered = result.joins(:company).order("companies.name asc")
    else
      result_ordered = result.order("#{order_by} #{order_direction}")
    end
    result_ordered
  end

  def show_open_jobs(result)
    result.where(member_working: nil)
  end

  def set_referer
    session[:return_to] ||= request.referer
  end
end
