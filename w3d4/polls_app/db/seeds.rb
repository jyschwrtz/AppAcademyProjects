# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  user1 = User.create!(username: 'Trung')
  user2 = User.create!(username: 'Jay')

  Poll.destroy_all
  poll1 = Poll.create!(title: 'what', author_id: user1.id)
  poll2 = Poll.create!(title: 'why', author_id: user2.id)

  Question.destroy_all
  question1= Question.create!(body: 'what is this', poll_id: poll1.id)
  question2= Question.create!(body: 'why are we doing this', poll_id: poll2.id)
  question3= Question.create!(body: 'what for dinner', poll_id: poll1.id)

  AnswerChoice.destroy_all
  answer_choices1= AnswerChoice.create!(body: '1. I dont know', question_id: question1.id)
  answer_choices2= AnswerChoice.create!(body: '2. I really dont know', question_id: question1.id)
  answer_choices3= AnswerChoice.create!(body: '3. something', question_id: question1.id)

  Response.destroy_all
  Response.create!(user_id: user1.id, answer_choice_id: answer_choices1.id)
  Response.create!(user_id: user2.id, answer_choice_id: answer_choices2.id)
  Response.create!(user_id: user1.id, answer_choice_id: answer_choices3.id)



end
