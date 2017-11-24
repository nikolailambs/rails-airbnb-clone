# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Set up a faker

require 'faker'


User.destroy_all
Office.destroy_all
Message.destroy_all
Booking.destroy_all

# email = ["admin@a.de", "test@t.de"]
# password = ["123456", "testtest"]
# count = 0

# create office & user
# urls = ['https://cdn.wework.com/locations/image/1e750e4e-6ff3-11e7-88f5-0a636a339cd2/2016026_South_Station_10th_Floor_Common_Area-2.jpg?auto=format%2Ccompress&dpr=2&ch=DPR%2CWidth&crop=false&fit=crop&w=800&h=600', 'https://cdn.wework.com/locations/image/3b5f7c62-877f-11e7-bee1-0a636a339cd2/20160216_Fine_Arts_LA_-_Members-35.jpg?auto=format%2Ccompress&dpr=2&ch=DPR%2CWidth&crop=false&fit=crop&w=800&h=600', 'https://cdn.wework.com/locations/image/c2ea2652-ea34-11e6-a107-0a488af3e541/20170202_Hackerscher_Markt_Common_Areas-10.jpg?auto=format%2Ccompress&dpr=2&ch=DPR%2CWidth&crop=false&fit=crop&w=450&h=220', 'https://cdn.wework.com/locations/image/e5691e42-b8cc-11e7-a540-0a636a339cd2/20160815_Berlin_Sony_Center_MVDK_-_Common_Area-4.jpg?auto=format%2Ccompress&dpr=2&ch=DPR%2CWidth&crop=false&fit=crop&w=450&h=220', 'https://cdn.wework.com/locations/image/0f5c55fe-c4c9-11e7-be60-0a636a339cd2/20170607_Waterhouse_Sq_Common_Areas-13.jpg?auto=format%2Ccompress&dpr=2&ch=DPR%2CWidth&crop=false&fit=crop&w=450&h=220']

u_one_demander = User.create!(          # USER DEMANDER!!
  :email  => "demander1@a.de",
  :password => "123456",
  :provider => 'false',
  :user_name => Faker::Name.first_name,
  :job_field => Faker::Job.field,
  :first_name => Faker::Name.first_name,
  :last_name => Faker::Name.last_name,
  :birthday => Faker::Date.birthday(18, 65),
  :address => Faker::Address.city,
  :phone => Faker::PhoneNumber.phone_number,
  :language => 'German',
  :currency => 'Euro',
  :personal_description => Faker::Lorem.sentence,
  )

u_two_demander = User.create!(          # USER DEMANDER!!
  :email  => "demander2@a.de",
  :password => "123456",
  :provider => 'false',
  :user_name => Faker::Name.first_name,
  :job_field => Faker::Job.field,
  :first_name => Faker::Name.first_name,
  :last_name => Faker::Name.last_name,
  :birthday => Faker::Date.birthday(18, 65),
  :address => Faker::Address.city,
  :phone => Faker::PhoneNumber.phone_number,
  :language => 'German',
  :currency => 'Euro',
  :personal_description => Faker::Lorem.sentence,
  )

u_three_demander = User.create!(          # USER DEMANDER!!
  :email  => "demander3@a.de",
  :password => "123456",
  :provider => 'false',
  :user_name => Faker::Name.first_name,
  :job_field => Faker::Job.field,
  :first_name => Faker::Name.first_name,
  :last_name => Faker::Name.last_name,
  :birthday => Faker::Date.birthday(18, 65),
  :address => Faker::Address.city,
  :phone => Faker::PhoneNumber.phone_number,
  :language => 'German',
  :currency => 'Euro',
  :personal_description => Faker::Lorem.sentence,
  )

u_one_provider = User.create!(      # USER PROVIDER !
  :email  => "provider@a.de",
  :password => "testtest",
  :provider => 'true',
  :user_name => Faker::Name.first_name,
  :job_field => Faker::Job.field,
  :first_name => Faker::Name.first_name,
  :last_name => Faker::Name.last_name,
  :birthday => Faker::Date.birthday(18, 65),
  :address => Faker::Address.city,
  :phone => Faker::PhoneNumber.phone_number,
  :language => 'German',
  :currency => "Euro",
  :personal_description => Faker::Lorem.sentence,
  )

o_one = Office.create!(
  :name => Faker::Name.first_name,
  :office_type => "Co-working Space",
  :size => "1-10 Persons",
  :address => Faker::Address.street_address,
  :availability => true,
  :available_from => Faker::Date.forward(1),
  :available_to => Faker::Date.forward(50),
  :city => Faker::Address.city,
  :price => Faker::Number.decimal(2),
  :description => Faker::Lorem.sentence,
  :facility_standard => 'premium',
  :period => Faker::Date.forward(23),
  :user_id => u_one_provider.id,
  :photo_urls => ['https://s-i.huffpost.com/gen/2938360/images/n-OFFICE-628x314.jpg', 'https://s7d4.scene7.com/is/image/roomandboard/parsons_189554_17e_g?$str_g$&size=760,480&scl=1', 'https://www.trabahomes.com/wp-content/uploads/2016/10/Astonishing-Swivel-Chair-Coupled-with-Minimalist-Modern-Office-Desk-Completed-with-Curved-Table-Lamp.jpg'],
 )

o_two = Office.create!(
  :name => Faker::Name.first_name,
  :office_type  => "Private Rooms",
  :size => "1 Person",
  :address => Faker::Address.street_address,
  :availability => true,
  :available_from => Faker::Date.forward(1),
  :available_to => Faker::Date.forward(50),
  :city => Faker::Address.city,
  :price => Faker::Number.decimal(2),
  :description => Faker::Lorem.sentence,
  :facility_standard => 'budget',
  :period => Faker::Date.forward(23),
  :user_id => u_one_provider.id,
  :photo_urls => ['https://i.pinimg.com/736x/74/5f/39/745f393c1adb66378e731cf036cb5ada--modern-office-design-interior-glass-office-design.jpg', 'https://s7d4.scene7.com/is/image/roomandboard/parsons_189554_17e_g?$str_g$&size=760,480&scl=1', 'https://www.trabahomes.com/wp-content/uploads/2016/10/Astonishing-Swivel-Chair-Coupled-with-Minimalist-Modern-Office-Desk-Completed-with-Curved-Table-Lamp.jpg'],
 )

o_three = Office.create!(
  :name => Faker::Name.first_name,
  :office_type => "Open office",
  :size => "10-50 Persons",
  :address => Faker::Address.street_address,
  :availability => true,
  :available_from => Faker::Date.forward(1),
  :available_to => Faker::Date.forward(50),
  :city => Faker::Address.city,
  :price => Faker::Number.decimal(2),
  :description => Faker::Lorem.sentence,
  :facility_standard => 'luxury',
  :period => Faker::Date.forward(23),
  :user_id => u_one_provider.id,
  :photo_urls => ['https://evermotion.org/files/tutorials_content/uploads/1_AI33_005_PP_copy.jpg', 'https://s7d4.scene7.com/is/image/roomandboard/parsons_189554_17e_g?$str_g$&size=760,480&scl=1', 'https://www.trabahomes.com/wp-content/uploads/2016/10/Astonishing-Swivel-Chair-Coupled-with-Minimalist-Modern-Office-Desk-Completed-with-Curved-Table-Lamp.jpg'],
 )

o_four = Office.create!(
  :name => Faker::Name.first_name,
  :office_type  => "Team Rooms",
  :size => "50-100 Persons",
  :address => Faker::Address.street_address,
  :availability => true,
  :available_from => Faker::Date.forward(1),
  :available_to => Faker::Date.forward(50),
  :city => Faker::Address.city,
  :price => Faker::Number.decimal(2),
  :description => Faker::Lorem.sentence,
  :facility_standard => 'premium',
  :period => Faker::Date.forward(23),
  :user_id => u_one_provider.id,
  :photo_urls => ['https://i.pinimg.com/originals/fc/cf/ef/fccfef26c5548ded4b355702fa222a9c.jpg', 'https://s7d4.scene7.com/is/image/roomandboard/parsons_189554_17e_g?$str_g$&size=760,480&scl=1', 'https://www.trabahomes.com/wp-content/uploads/2016/10/Astonishing-Swivel-Chair-Coupled-with-Minimalist-Modern-Office-Desk-Completed-with-Curved-Table-Lamp.jpg'],
 )

o_five = Office.create!(
  :name => Faker::Name.first_name,
  :office_type  => "Work lounge",
  :size => "1-10 Persons",
  :address => Faker::Address.street_address,
  :availability => true,
  :available_from => Faker::Date.forward(1),
  :available_to => Faker::Date.forward(50),
  :city => Faker::Address.city,
  :price => Faker::Number.decimal(2),
  :description => Faker::Lorem.sentence,
  :facility_standard => 'premium',
  :period => Faker::Date.forward(23),
  :user_id => u_one_provider.id,
  :photo_urls => ['http://www.pricemodern.com/wp-content/uploads/2015/07/abracadab_img_2.jpg', 'https://s7d4.scene7.com/is/image/roomandboard/parsons_189554_17e_g?$str_g$&size=760,480&scl=1', 'https://www.trabahomes.com/wp-content/uploads/2016/10/Astonishing-Swivel-Chair-Coupled-with-Minimalist-Modern-Office-Desk-Completed-with-Curved-Table-Lamp.jpg'],
 )

m_one = Message.create!(
  :title => 'I want to book this!',
  :content => Faker::Lorem.sentence,
  :user_id => u_one_demander.id,
  :office_id => o_one.id,
  )

m_one = Message.create!(
  :title => 'Hey dude, can I do something on the price!',
  :content => Faker::Lorem.sentence,
  :user_id => u_two_demander.id,
  :office_id => o_three.id,
  )

m_one = Message.create!(
  :title => 'ISSUES!',
  :content => Faker::Lorem.sentence,
  :user_id => u_three_demander.id,
  :office_id => o_two.id,
  )

m_two = Message.create!(
  :title => 'I give you infos about my office!',
  :content => Faker::Lorem.sentence,
  :user_id => u_one_provider.id,
  :office_id => o_one.id,
  )

m_two = Message.create!(
  :title => 'I give you infos about my office!',
  :content => Faker::Lorem.sentence,
  :user_id => u_one_provider.id,
  :office_id => o_two.id,
  )

booking = Booking.create!(
  :date_from => '01.01.2018',
  :date_to => '10.11.2018',
  :number_people => 10,
  :accepting => true,
  :office_id => o_five.id,
  :user_id => u_one_demander.id,
  )

booking = Booking.create!(
  :date_from => '23.11.2017',
  :date_to => '09.12.2017',
  :number_people => 10,
  :accepting => true,
  :office_id => o_one.id,
  :user_id => u_one_demander.id,
  )

booking = Booking.create!(
  :date_from => '11.11.2017',
  :date_to => '20.11.2017',
  :number_people => 10,
  :accepting => true,
  :office_id => o_three.id,
  :user_id => u_one_demander.id,
  )

booking = Booking.create!(
  :date_from => '10.11.2017',
  :date_to => '10.11.2017',
  :number_people => 10,
  :accepting => true,
  :office_id => o_two.id,
  :user_id => u_one_demander.id,
  )

booking = Booking.create!(
  :date_from => '10.10.2017',
  :date_to => '10.11.2017',
  :number_people => 10,
  :accepting => true,
  :office_id => o_four.id,
  :user_id => u_one_demander.id,
  )
