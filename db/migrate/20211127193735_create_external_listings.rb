class CreateExternalListings < ActiveRecord::Migration
  def change
    create_table :external_listings do |t|
      t.string :job_title
      t.string :company_name
      t.string :location
      t.string :job_listing_url
      t.string :pay_rate
      t.string :job_type
      t.string :no_of_hires

      t.timestamps null: false
    end
  end
end
