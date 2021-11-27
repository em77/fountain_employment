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
  company.social_enterprise = [false, false, true].sample
  company.save!
  listing = Listing.new
  listing.member_working = [Faker::Name.name, ""].sample
  listing.job_title = Faker::Company.profession.capitalize
  listing.description = Faker::Commerce.department
  listing.hours_weekly = Random.new.rand(500..4000)
  listing.shift = ["Morning", "Afternoon", "Evening", "Overnight"].sample
  listing.employment_type = ["Transitional", "Supported"].sample
  start_date = Faker::Date.between(Date.today, Faker::Date.forward(30))
  listing.start_date = start_date.strftime("%m-%d-%Y")
  est_end_date = Faker::Date.between(Faker::Date.forward(90), 
    Faker::Date.forward(200))
  listing.est_end_date = est_end_date.strftime("%m-%d-%Y")
  listing.wage = Random.new.rand(1000..2500)
  listing.te_placement_manager = Faker::Name.name
  listing.company_id = Random.new.rand(Company.first[:id]..Company.last[:id])
  listing.save!
end

ExternalListing.destroy_all

50.times do
  external_listing = ExternalListing.new
  external_listing.job_title = Faker::Job.position
  external_listing.company_name = Faker::Company.name
  external_listing.location = Faker::Nation.capital_city
  external_listing.job_listing_url = Faker::Internet.url
  external_listing.pay_rate = "#{Random.new.rand(10..25)}/hour"
  external_listing.job_type = ["Full-time", "Part-time"].sample
  external_listing.no_of_hires = Random.new.rand(1..25)
  external_listing.save!
end
