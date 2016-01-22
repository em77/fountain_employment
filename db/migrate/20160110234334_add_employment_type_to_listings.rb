class AddEmploymentTypeToListings < ActiveRecord::Migration
  def change
    add_column :listings, :employment_type, :string
  end
end
