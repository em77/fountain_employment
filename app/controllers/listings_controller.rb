class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  autocomplete :company, :name
  include ApplicationHelper

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
    @result = show_open_jobs(@result) if params[:open_jobs]
    @result = employment_filterer(@result, params[:employment_filter]) if
      params[:employment_filter]
    @result = orderer(@result, params[:order], params[:order_direction]) if
      params[:order]
    @result = paginated(@result)
  end

  def new
    @listing = Listing.new
  end

  def show
  end

  def edit
  end

  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice:
        "Listing was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(article_params)
    if @listing.valid?
      @listing.update(article_params)
      redirect_to(listing_path(@listing), notice: "Listing edited successfully")
    else
      flash[:error] = @listing.errors.full_messages.to_sentence
      redirect_to(edit_listing_path(@listing))
    end
  end

  def create
    @listing = Listing.new(article_params)
    # @listing.company_id = params[:listing][:my_company_id]
    @listing.job_title = params[:listing][:job_title]
    @listing.company_id = params[:listing][:company_id]
    @listing.description = params[:listing][:description]
    @listing.wage = decimal_to_int(params[:listing][:wage])
    @listing.working_hours_desc = params[:listing][:working_hours_desc]
    @listing.hours_weekly = decimal_to_int(params[:listing][:hours_weekly])
    @listing.shift = params[:listing][:shift]
    @listing.employment_type = params[:listing][:employment_type]
    @listing.start_date = params[:listing][:start_date]
    @listing.est_end_date = params[:listing][:est_end_date]
    @listing.te_placement_manager = params[:listing][:te_placement_manager]
    @listing.member_working = params[:listing][:member_working]
    if @listing.valid?
      @listing.save
      redirect_to(listings_path, notice: "Listing created successfully")
    else
      flash[:error] = @listing.errors.full_messages.to_sentence
      redirect_to(new_listing_path)
    end
  end

  rescue_from "ActiveRecord::InvalidForeignKey" do
    message = "The company name entered doesn't exist. You must first" +
    " create a company with the" +
    " <a href='#{new_company_path}'>New Company</a>" +
    " form before you can create listings for it. If you already created" +
    " the company, ensure correct spelling by typing in the name and" +
    " selecting it when it appears."
    flash[:error] = message
    redirect_to(new_listing_path)
  end

  def search_companies_and_listings(param)
    listings = Listing.search(param)
    company_listings = Company.search(param)
    listings.union(company_listings)
  end

  def employment_filterer(listings, filter)
    listings.where("employment_type = ?", filter)
  end

  private
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def article_params
      params.require(:listing).permit(:job_title, :company_id, :description,
        :wage, :working_hours_desc, :hours_weekly, :shift, :employment_type,
        :start_date, :est_end_date, :te_placement_manager, :member_working)      
    end    
end
