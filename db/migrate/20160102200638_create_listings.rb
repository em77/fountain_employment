class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :member_working
      t.string :job_title
      t.string :description
      t.text :working_hours_desc
      t.integer :hours_weekly
      t.string :shift
      t.string :start_date
      t.string :est_end_date
      t.integer :wage
      t.text :te_placement_manager
      t.timestamps null: false
    end
  end
end
