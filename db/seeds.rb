# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(:email => "admin@tricksters.sk", :password => "Ger1aCh", :password_confirmation => "Ger1aCh")

Player.create!(:name => "Adam", :surname => "Desko", :email => "ad@syr.edu", :phone => "123456", :bank_account => "123454")
Player.create!(:name => "John", :surname => "Desko", :email => "jd@syr.edu", :phone => "1234567", :bank_account => "1234544")
Player.create!(:name => "George", :surname => "Desko", :email => "Gd@syr.edu", :phone => "12345678", :bank_account => "1234543")
Player.create!(:name => "Martin", :surname => "Desko", :email => "Md@syr.edu", :phone => "123456789", :bank_account => "1234542")
Player.create!(:name => "Jaroslav", :surname => "Desko", :email => "jrd@syr.edu", :phone => "1234567890", :bank_account => "1234541")

Travel.create(:destination => "TestDest", :description => "TestDescription", :cars_count => 2, :travel_distance => 100)
