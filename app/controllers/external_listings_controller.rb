class ExternalListingsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :destroy, :update]
  before_action :set_external_listing, only: [:edit, :update, :destroy]

  attr_accessor :external_listing, :external_listings
  helper_method :external_listing, :external_listings

  def index
    @external_listings = paginated(ExternalListing.all)
  end

  def new
    @external_listing = ExternalListing.new
  end

  def create
    @external_listing = ExternalListing.new(external_listing_params)
    if @external_listing.save
      redirect_to(external_listings_path, notice:
        "External Listing created successfully")
    else
      flash[:error] = @external_listing.errors.full_messages.to_sentence
      redirect_to(external_listings_path)
    end
  end

  def edit
  end

  def update
    if @external_listing.update(external_listing_params)
      redirect_to(external_listings_path, notice:
        "External Listing edited successfully")
    else
      flash[:error] = @external_listing.errors.full_messages.to_sentence
      redirect_to(external_listings_path)
    end
  end

  def destroy
    @external_listing.destroy
    respond_to do |format|
      format.html { redirect_to(external_listings_path, notice:
        "External Listing was successfully deleted.") }
      format.json { head :no_content }
    end
  end

  private

  def external_listing_params
    params.require(:external_listing).permit(:job_title, :company_name,
      :location, :job_listing_url, :pay_rate, :job_type, :no_of_hires)
  end

  def set_external_listing
    @external_listing = ExternalListing.find(params[:id])
  end
end
