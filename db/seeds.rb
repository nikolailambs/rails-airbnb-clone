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

# create office & user
urls = ['https://cdn.wework.com/locations/image/1e750e4e-6ff3-11e7-88f5-0a636a339cd2/2016026_South_Station_10th_Floor_Common_Area-2.jpg?auto=format%2Ccompress&dpr=2&ch=DPR%2CWidth&crop=false&fit=crop&w=800&h=600', 'https://cdn.wework.com/locations/image/3b5f7c62-877f-11e7-bee1-0a636a339cd2/20160216_Fine_Arts_LA_-_Members-35.jpg?auto=format%2Ccompress&dpr=2&ch=DPR%2CWidth&crop=false&fit=crop&w=800&h=600', 'https://cdn.wework.com/locations/image/c2ea2652-ea34-11e6-a107-0a488af3e541/20170202_Hackerscher_Markt_Common_Areas-10.jpg?auto=format%2Ccompress&dpr=2&ch=DPR%2CWidth&crop=false&fit=crop&w=450&h=220', 'https://cdn.wework.com/locations/image/e5691e42-b8cc-11e7-a540-0a636a339cd2/20160815_Berlin_Sony_Center_MVDK_-_Common_Area-4.jpg?auto=format%2Ccompress&dpr=2&ch=DPR%2CWidth&crop=false&fit=crop&w=450&h=220', 'https://cdn.wework.com/locations/image/0f5c55fe-c4c9-11e7-be60-0a636a339cd2/20170607_Waterhouse_Sq_Common_Areas-13.jpg?auto=format%2Ccompress&dpr=2&ch=DPR%2CWidth&crop=false&fit=crop&w=450&h=220']


15.times do |index|
  u = User.create(
    :email  => Faker::Internet.free_email,
    :encrypted_password => Faker::Internet.password(10, 20),
    :provider => 'true',
    :user_name => Faker::Name.first_name,
    :job_field => Faker::Job.field,
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :birthday => Faker::Date.birthday(18, 65),
    :address => Faker::Address.city,
    :phone => Faker::PhoneNumber.phone_number,
    :language => ['German', 'English', 'Spanish'].sample,
    :currency => ['Euro', 'Dollar', 'Peso'].sample,
    :personal_description => Faker::Lorem.sentence,
    )
    o = Office.create(
      :size => Faker::Space.distance_measurement,
      :address => Faker::Address.street_address,
      :availability => Faker::Boolean.boolean,
      :city => Faker::Address.city,
      :price => Faker::Number.decimal(2),
      :description => Faker::Lorem.sentence,
      :facility_standard => ['budget', 'standard', 'premium', 'luxury'].sample,
      :period => Faker::Date.forward(23),
      user: u,
     )


    o.photo_urls = urls
    o.save!
end



