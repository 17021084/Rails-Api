# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  Post.create(title: Faker::Book.title, body: Faker::Lorem.sentence)
end

User.create(username: 'trung', password: "12345678", age: 27)

5.times do
  Order.create(name: Faker::Name.name, email: Faker::Internet.email , address: Faker::Address.city , phone: Faker::PhoneNumber.phone_number, message: Faker::Lorem.sentence )
end