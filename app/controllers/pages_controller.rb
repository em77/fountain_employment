class PagesController < ApplicationController
  def home
    unless Company.count < 2
      @result = Company.all[0..-1]
    else
      @result = Company.new
      @result.id = 1
      @result.name = "Sample Company"
      @result.description = "Sample Description"
      @result = [@result]
      @result = @result[1..-1]
    end
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

  def sga
  end

  def benefits_calc
    respond_to :html, :js
  end
end
