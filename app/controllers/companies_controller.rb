class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @result = Company.all
    @result = orderer(@result, params[:order]) if params[:order]
    @result = paginated(@result, 24)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.save
    if @company.valid?
      @company.save
      redirect_to(companies_path, notice: "Company created successfully")
    else
      flash[:error] = @company.errors.full_messages.to_sentence
      redirect_to(new_company_path)
    end
  end

  def edit
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice:
        "Company was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def destroy_all_listings
    company_id = params[:id]
    Listing.where("company_id = ?", company_id).each do |listing|
      listing.destroy
    end
    redirect_to(company_path(company_id), notice: "All listings for" +
      " #{Company.find(company_id).name} deleted.")
  end

  rescue_from "ActiveRecord::InvalidForeignKey" do
    message = "Before deleting a company, you must delete all of its job" +
    " listings. To do that, you can click on \"Delete all listings.\""
    flash[:error] = message
    redirect_to(company_path(@company))
  end

  def show
    @result = Listing.where("company_id = ?", @company.id)
    @result = show_open_jobs(@result) if params[:open_jobs]
    @result = orderer(@result, params[:order], params[:order_direction]) if
      params[:order]
    @result = paginated(@result)
  end

  def update
    @company.update(company_params)
    if @company.valid?
      @company.update(company_params)
      redirect_to(company_path(@company), notice: "Company edited successfully")
    else
      flash[:error] = @company.errors.full_messages.to_sentence
      redirect_to(edit_company_path(@company))
    end
  end

  private

    def company_params
      params.require(:company).permit(:name, :description, :logo)
    end

    def set_company
      @company = Company.find(params[:id])
    end
end
