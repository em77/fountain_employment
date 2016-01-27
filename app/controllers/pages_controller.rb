class PagesController < ApplicationController
  def home
    @first = [Company.first]
    @result = Company.all[1..-1]
  end

  def b_1619
  end

  def pass
  end

  def subsidy
  end

  def ticket_to_work
  end

  def trial_work_period
  end

  def benefits_calc
    respond_to :html, :js
  end
end
