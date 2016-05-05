# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 500.times do |i|
#   Urlshort.create!(
#     originalurl: Faker::Internet.url
#     encryptedurl: Faker::Internet.url('localhost:3000')
#     ipaddress: Faker::Internet.ip_v4_address
#     user_id: 1)
#
# end

500.times do
     Urlshort.create!(
        originalurl: Faker::Internet.url,
        shorturl: Faker::Name.first_name,
        ipaddress: Faker::Internet.ip_v4_address,
        user_id: Faker::Number.between(1, 2)
      )
end
