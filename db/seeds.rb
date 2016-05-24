# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#User.create(name: 'admin', email: "admin@gmail.com", password: "qwerty123", password_confirmation: "qwerty213", admin: true)
# User.delete_all
# RequestType.delete_all
# user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'qwerty123', :password_confirmation => 'qwerty123'
user2 = User.create! :name => 'Admin', :email => 'admin@admin.com', :password => 'qwerty123C', :password_confirmation => 'qwerty123C' ,:admin => true
request_type1 = RequestType.create! :name => 'Restourants', :keyword => "cafe restourant bar carryout coffeshop pizzeria teahouse winebar snack pop-up snackbar pizza grill eatery coffehouse",
 :positive_verb => "tasty good delicious", :negative_verb => "bad nottasty ugly tasteless inedible sour stale bland unpalatable"