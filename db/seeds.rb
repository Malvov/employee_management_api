# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Admin user

User.create!(username: 'Admin user', email: 'mail1@mail.com', password: 'password', role: 'admin', employee_attributes: { first_name: 'Admin', last_name: 'User', 
entry_date: '19970303', active: true)
