class Company < ActiveRecord::Base
  has_many :listings, inverse_of: :company
  has_attached_file :logo, styles: { medium: "200x200>", thumb: "100x100>" },
    s3_protocol: :https
  validates_attachment_content_type :logo,
    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  include PgSearch
  pg_search_scope :search_companies, against: [:name, :description],
                  using: { tsearch: { dictionary: "english" } }

  def self.search(search)
    results = Company.search_companies(search)
    return Listing.search_listings("") if results.empty?
    results_array = []
    results.each do |result|
      results_array << Listing.search_listing_by_company(result[:id])
    end
    if results_array.count > 1
      counter = 1
      final = results_array[0].dup
      until counter == results_array.count
        final = final.union(results_array[counter])
        counter += 1
      end
      return final
    else
      return results_array[0]
    end
  end
end
