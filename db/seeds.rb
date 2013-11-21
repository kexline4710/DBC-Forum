# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new(name: "Tanner", email: "tanner@dbc.com", password: "password", password_confirmation: "password")
user.save

question = user.questions.new(title: "Our first blog post", body: "Hi everyone! This is my first post and I'm so excited to tell you about my day.")
question.save

answer = question.answers.new()
answer.responder_id = 1
answer.body = "I'm excited too!"
answer.save
answer2 = question.answers.new()
answer2.responder_id = 1
answer2.body = "Shut it!"
answer2.save
# answer2 = user.answers.new(body: "You suck!", question_id: 1)
# answer2.save
