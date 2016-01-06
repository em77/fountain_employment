class AddCompanyToListings < ActiveRecord::Migration
  def change
    add_reference :listings, :company, index: true, foreign_key: true
  end
end
