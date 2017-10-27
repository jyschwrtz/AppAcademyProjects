# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Band.destroy_all

user1 = User.create!(email: 'j@mail.com', password: 'password')
user2 = User.create!(email: 'e@mail.com', password: 'password')

band1 = Band.create!(name: 'Switchfoot')
band2 = Band.create!(name: 'Taylor Swift')
band3 = Band.create!(name: 'Beatles')
