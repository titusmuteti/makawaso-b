# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
puts "🌱 Seeding..."

20.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  phone_number = Faker::PhoneNumber.phone_number_with_country_code

  Client.create(
    first_name: first_name,
    last_name: last_name,
    email: email,
    phone_number: phone_number
  )
end

employee = Employee.create([
    {
        first_name: "David",
        last_name: "Mutembei",
        location: "Tala",
        email: "david@gmail.com"
    },
    {
        first_name: "Morris",
        last_name: "Obama",
        location: "Nguluni",
        email: "morris@gmail.com"
    },
    {
        first_name: "Tom",
        last_name: "Mutisya",
        location: "Kathithyamaa",
        email: "tom@gmail.com"
    },
    {
        first_name: "Ngusya",
        last_name: "Mule",
        location: "Kangundo",
        email: "mule@gmail.com"
    },
    {
        first_name: "Grace",
        last_name: "Kalondu",
        location: "Tala",
        email: "grace@gmail.com"
    },
    {
        first_name: "Rama",
        last_name: "Scholes",
        location: "Kangundo",
        email: "rama@gmail.com"
    },
    {
        first_name: "Moses",
        last_name: "Mwanzia",
        location: "Nguluni",
        email: "mose@gmail.com"
    },
])

20.times do
    date_read = Faker::Date.backward(days: 14)
    previous_reading = Faker::Number.between(from: 15, to: 100) 
    current_reading = Faker::Number.between(from: 20, to: 200) 
    balance = Faker::Number.between(from: 5, to: 1000) 
    paid = Faker::Boolean.boolean 
    date_paid = Faker::Date.forward(days: 14)
  
    Bill.create(
        date_read: date_read,
        previous_reading: previous_reading,
        current_reading: current_reading,
        balance: balance,
        paid: paid,
        date_paid: date_paid
    )
  end
  

puts "✅ Done seeding!"