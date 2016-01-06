class ListingsController < ApplicationController
  def index
    if params[:search].nil?
      @result = Listing.all
    else
      @result = search_companies_and_listings(params[:search])
    end
    if @result.empty?
      @result = Listing.all
      flash.now[:error] = "No jobs found with that search - Displaying all" +
        " listings"
    end
    @result = orderer(@result, params[:order]) if params[:order]
    @result = paginated(@result)
  end

  def search_companies_and_listings(param)
    listings = Listing.search(param)
    company_listings = Company.search(param)
    listings.union(company_listings)
  end

  def paginated(to_paginate)
    to_paginate.paginate(:page => params[:page], :per_page => 25)
  end

  def orderer(result, order_by)
    result.order(order_by)
  end
end
