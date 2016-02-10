class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def paginated(to_paginate, num_per_page = 25)
    to_paginate.paginate(page: params[:page], per_page: num_per_page)
  end

  def date_order_formatter(date_string)
    Date.strptime(date_string,"%m-%d-%Y").to_s
  end

  def orderer(result, order_by, order_direction = "asc")
    if order_by == "company_id"
      result_ordered = result.joins(:company).order("companies.name asc")
    elsif order_by == "start_date" || order_by == "est_end_date"
      result_ordered = result.sort_by{|listing| date_order_formatter(listing.send(order_by.to_sym))}
      result_ordered = result_ordered.reverse if order_direction == "desc"
    else
      result_ordered = result.order("#{order_by} #{order_direction}")
    end
    result_ordered
  end

  def show_open_jobs(result)
    result.where("member_working = ?", "")
  end

  def set_referer
    session[:return_to] ||= request.referer
  end

  def member_working_sanitizer(value)
    if value.nil? || value.blank?
      ""
    else
      value
    end
  end
end
