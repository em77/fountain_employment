class Listing < ActiveRecord::Base
  belongs_to :company
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
