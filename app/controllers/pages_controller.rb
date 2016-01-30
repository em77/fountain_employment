class PagesController < ApplicationController
  def home
    unless Company.count < 2
      @first = [Company.first]
      @result = Company.all[1..-1]
    else
      @first = Company.new
      @first.id = 1
      @first.name = "Sample Company"
      @first.description = "Sample Description"
      @first = [@first]
      @result = @first[1..-1]
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

  def benefits_calc
    respond_to :html, :js
  end
end
