class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :set_referer, only: [:destroy, :edit, :new]
  before_action :normalize_create_update_params, only: [:update, :create]
  autocomplete :company, :name
  include ApplicationHelper

  attr_accessor :result, :listing
  helper_method :result, :listing

  def index
    @result = search_handler
    @result = filter_handler(@result)
    @result = paginated(@result)
  end

  def search_handler
    if params[:search].nil? || params[:search].empty?
      flash.now[:success] = "Displaying all listings"
      return Listing.all
    end

    result = Listing.search_companies_and_listings(params[:search])

    if result.empty?
      flash.now[:error] = "No jobs found with that search - Displaying all" +
        " listings"
      Listing.all
    else
      result
    end
  end

  def filter_handler(result)
    result = show_open_jobs(result) if params[:open_jobs]
    result = employment_filterer(result, params[:employment_filter]) if
      params[:employment_filter]
    if params[:order]
      result = orderer(result, params[:order], params[:order_direction])
    else
      result = orderer(result, "company_id")
    end
    result
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
      format.html { redirect_to(session.delete(:return_to), notice:
        "Listing was successfully deleted.") }
      format.json { head :no_content }
    end
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.valid?
      @listing.update(listing_params)
      redirect_to(session.delete(:return_to), notice:
        "Listing edited successfully")
    else
      flash[:error] = @listing.errors.full_messages.to_sentence
      redirect_to(session.delete(:return_to))
    end
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.valid?
      @listing.save
      redirect_to(session.delete(:return_to), notice:
        "Listing created successfully")
    else
      flash[:error] = @listing.errors.full_messages.to_sentence
      redirect_to(session.delete(:return_to))
    end
  end

  rescue_from "ActiveRecord::InvalidForeignKey" do
    flash[:error] = Listing.company_field_error_message
    redirect_to(new_listing_path)
  end

  def employment_filterer(listings, filter)
    listings.where("employment_type = ?", filter)
  end

  private
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def normalize_create_update_params
      params[:listing][:wage] = decimal_to_int(params[:listing][:wage].to_s)
      params[:listing][:hours_weekly] = decimal_to_int(params[:listing]\
        [:hours_weekly].to_s)
      params[:listing][:member_working] = member_working_sanitizer(\
        params[:listing][:member_working])
    end

    def listing_params
      params.require(:listing).permit(:job_title, :company_id, :description,
        :wage, :working_hours_desc, :hours_weekly, :shift, :employment_type,
        :start_date, :est_end_date, :te_placement_manager, :member_working)
    end    
end
