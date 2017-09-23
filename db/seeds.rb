# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Customer.delete_all

# 10.times do |i|
# 	Customer.create!(
# 		name: "test#{i}",
# 		status: i % 2 == 0 ? true : false,
# 	)

Account.delete_all
Account.create!(
  name: "admin",
  email: 'admin@example.com',
  password: '123456789',
  role: 'administrator',
)
