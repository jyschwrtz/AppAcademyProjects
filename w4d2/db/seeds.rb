# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all
CatRentalRequest.destroy_all

cat1 = Cat.create!(birth_date: Faker::Date.backward(999), name: Faker::Cat.name, color: %w(black white brown red blue).sample, sex: ['M','F'].sample)
cat2 = Cat.create!(birth_date: Faker::Date.backward(999), name: Faker::Cat.name, color: %w(black white brown red blue).sample, sex: ['M','F'].sample)
cat3 = Cat.create!(birth_date: Faker::Date.backward(999), name: Faker::Cat.name, color: %w(black white brown red blue).sample, sex: ['M','F'].sample)
cat4 = Cat.create!(birth_date: Faker::Date.backward(999), name: Faker::Cat.name, color: %w(black white brown red blue).sample, sex: ['M','F'].sample)
cat5 = Cat.create!(birth_date: Faker::Date.backward(999), name: Faker::Cat.name, color: %w(black white brown red blue).sample, sex: ['M','F'].sample)
cat6 = Cat.create!(birth_date: Faker::Date.backward(999), name: Faker::Cat.name, color: %w(black white brown red blue).sample, sex: ['M','F'].sample)
cat7 = Cat.create!(birth_date: Faker::Date.backward(999), name: Faker::Cat.name, color: %w(black white brown red blue).sample, sex: ['M','F'].sample)
cat8 = Cat.create!(birth_date: Faker::Date.backward(999), name: Faker::Cat.name, color: %w(black white brown red blue).sample, sex: ['M','F'].sample)
cat9 = Cat.create!(birth_date: Faker::Date.backward(999), name: Faker::Cat.name, color: %w(black white brown red blue).sample, sex: ['M','F'].sample)

rq1 = CatRentalRequest.create!(cat_id: cat1.id, start_date: '2017/10/14', end_date: '2017/10/27', status: 'APPROVED')
rq2 = CatRentalRequest.create!(cat_id: cat1.id, start_date: '2017/10/24', end_date: '2017/10/25')
rq3 = CatRentalRequest.create!(cat_id: cat1.id, start_date: '2017/10/28', end_date: '2017/10/30')
rq3 = CatRentalRequest.create!(cat_id: cat1.id, start_date: '2017/10/25', end_date: '2017/10/30')
