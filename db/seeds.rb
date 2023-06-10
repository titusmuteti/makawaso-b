require 'faker'
puts "🌱 Seeding..."

# 20.times do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   email = Faker::Internet.email
#   phone_number = Faker::PhoneNumber.phone_number_with_country_code
#   employee_id = Faker::Number.between(from: 1, to: 7)

#   Client.create(
#     first_name: first_name,
#     last_name: last_name,
#     email: email,
#     phone_number: phone_number,
#     employee_id: employee_id
#   )
# end

# employee = Employee.create([
#     {
#         first_name: "David",
#         last_name: "Mutembei",
#         location: "Tala",
#         email: "david@gmail.com",
#         client_id: balance = Faker::Number.between(from: 1, to: 20)
#     },
#     {
#         first_name: "Morris",
#         last_name: "Obama",
#         location: "Nguluni",
#         email: "morris@gmail.com",
#         client_id: balance = Faker::Number.between(from: 1, to: 20)
#     },
#     {
#         first_name: "Tom",
#         last_name: "Mutisya",
#         location: "Kathithyamaa",
#         email: "tom@gmail.com",
#         client_id: balance = Faker::Number.between(from: 1, to: 20)
#     },
#     {
#         first_name: "Ngusya",
#         last_name: "Mule",
#         location: "Kangundo",
#         email: "mule@gmail.com",
#         client_id: balance = Faker::Number.between(from: 1, to: 20)
#     },
#     {
#         first_name: "Grace",
#         last_name: "Kalondu",
#         location: "Tala",
#         email: "grace@gmail.com",
#         client_id: balance = Faker::Number.between(from: 1, to: 20)
#     },
#     {
#         first_name: "Rama",
#         last_name: "Scholes",
#         location: "Kangundo",
#         email: "rama@gmail.com",
#         client_id: balance = Faker::Number.between(from: 1, to: 20)
#     },
#     {
#         first_name: "Moses",
#         last_name: "Mwanzia",
#         location: "Nguluni",
#         email: "mose@gmail.com",
#         client_id: balance = Faker::Number.between(from: 1, to: 20)
#     },
# ])

CITY_NAMES = ['Tala', 'Nguluni', 'Kathithyamaa']
# location = CITY_NAMES.sample


20.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.email
    phone_number = Faker::PhoneNumber.phone_number_with_country_code
    location = CITY_NAMES.sample
  
    employee = Employee.create(
      first_name: first_name,
      last_name: last_name,
      email: email,
      location: location,
    #   client_id: Faker::Number.between(from: 1, to: 20)
    )
  
    client = Client.create(
      first_name: first_name,
      last_name: last_name,
      email: email,
      phone_number: phone_number
    )
    # employee.update(client_id: client.id)

    employee.update(client_id: client.id)
    client.update(employee_id: employee.id)

    EmployeeClient.create(employee: employee, client: client)
  end
  

  

30.times do
    date_read = Faker::Date.backward(days: 14)
    previous_reading = Faker::Number.between(from: 15, to: 100) 
    current_reading = Faker::Number.between(from: 20, to: 200) 
    balance = Faker::Number.between(from: 5, to: 1000) 
    paid = Faker::Boolean.boolean 
    date_paid = Faker::Date.forward(days: 14)
    client_id = Faker::Number.between(from: 1, to: 20)
  
    Bill.create(
        date_read: date_read,
        previous_reading: previous_reading,
        current_reading: current_reading,
        balance: balance,
        paid: paid,
        date_paid: date_paid,
        client_id: client_id
    )
  end
  

puts "✅ Done seeding!"
