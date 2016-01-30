class Listing < ActiveRecord::Base
  belongs_to :company

  def self.company_field_error_message
    "name entered doesn't exist. You must first" +
    " create a company with the" +
    " <a href='/companies/new'>New Company</a>" +
    " form before you can create listings for it. If you already created" +
    " the company, ensure correct spelling by typing in the name and" +
    " selecting it when it appears."
  end

  validates :company, presence: { allow_blank: false,
    message: Listing.company_field_error_message }
  include PgSearch
  pg_search_scope :search_listings, against: [
                                              :member_working,
                                              :job_title,
                                              :description,
                                              :working_hours_desc,
                                              :hours_weekly,
                                              :shift,
                                              :te_placement_manager
                                             ],
                  using: { tsearch: { dictionary: "english" } }
  pg_search_scope :search_listing_by_company, against: :company_id,
                  using: { tsearch: { dictionary: "english" } }

  def self.search(search)
    if search
      self.search_listings(search)
    else
      all
    end
  end
end
