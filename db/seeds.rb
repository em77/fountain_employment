# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Listing.destroy_all
Company.destroy_all

200.times do
  company = Company.new
  company.name = Faker::Company.name
  company.description = Faker::Company.catch_phrase
  company.save!
  listing = Listing.new
  listing.member_working = [Faker::Name.name, nil].sample
  listing.job_title = Faker::Company.profession.capitalize
  listing.description = Faker::Commerce.department
  # listing.working_hours_desc = "M-F 9-5"
  listing.hours_weekly = Random.new.rand(500..4000)
  listing.shift = ["Morning", "Afternoon", "Evening", "Overnight"].sample
  listing.employment_type = ["Transitional", "Supported", "Social Enterprise"].sample
  listing.start_date = Faker::Date.between(Date.today, Faker::Date.forward(30))
  listing.est_end_date = Faker::Date.between(Faker::Date.forward(90), 
    Faker::Date.forward(200))
  listing.wage = Random.new.rand(1000..2500)
  listing.te_placement_manager = Faker::Name.name
  listing.company_id = Random.new.rand(Company.first[:id]..Company.last[:id])
  listing.save!
end

# company = Company.new
# company.name = "Bob's Restaurant"
# company.description = "We are a great restaurant serving many types of food."
# company.save!
# listing = Listing.new
# listing.member_working = "Gail Richards"
# listing.job_title = "Dishwasher"
# listing.description = "You will wash dishes"
# listing.working_hours_desc = "M-F 9-5"
# listing.hours_weekly = 4000
# listing.shift = "Day"
# listing.start_date = "1/5/2016"
# listing.est_end_date = "7/1/2016"
# listing.wage = 1800
# listing.te_placement_manager = "Jay Peterson"
# listing.company_id = Company.find_by(name: "Bob's Restaurant").id
# listing.save!

# company = Company.new
# company.name = "JC Auto Repair"
# company.description = "We specialize in Audi and BMW repair in New York."
# company.save!
# listing = Listing.new
# listing.member_working = "Joe Ciffereta"
# listing.job_title = "Janitor"
# listing.description = "Basic janitorial duties"
# listing.working_hours_desc = "M-F 9-1"
# listing.hours_weekly = 2000
# listing.shift = "Morning"
# listing.start_date = "2/5/2016"
# listing.est_end_date = "10/1/2016"
# listing.wage = 1550
# listing.te_placement_manager = "Erik Patterson"
# listing.company_id = Company.find_by(name: "JC Auto Repair").id
# listing.save!

# company = Company.new
# company.name = "Warner Bros."
# company.description = "Movies, TV, Music, we do it all."
# company.save!
# listing = Listing.new
# listing.member_working = "Curtis Jackson"
# listing.job_title = "Junior Record Producer"
# listing.description = "Assist in recording of upcoming artists."
# listing.working_hours_desc = "M W F 9-1"
# listing.hours_weekly = 1200
# listing.shift = "Morning"
# listing.start_date = "2/10/2016"
# listing.est_end_date = "11/1/2016"
# listing.wage = 5075
# listing.te_placement_manager = "Erik Patterson"
# listing.company_id = Company.find_by(name: "Warner Bros.").id
# listing.save!

# company = Company.new
# company.name = "Green Rabbit Moving"
# company.description = "We move New York and New Jersey for competitive rates."
# company.save!
# listing = Listing.new
# listing.member_working = "Brad Pitt"
# listing.job_title = "Mover"
# listing.description = "Heavy lifting experience required"
# listing.working_hours_desc = "M-W 9-4"
# listing.hours_weekly = 2100
# listing.shift = "Day"
# listing.start_date = "1/10/2016"
# listing.est_end_date = "4/1/2016"
# listing.wage = 1000
# listing.te_placement_manager = "Arlo Guthrie"
# listing.company_id = Company.find_by(name: "Green Rabbit Moving").id
# listing.save!