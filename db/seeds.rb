# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'yshmarov@gmail.com', password: 'yshmarov@gmail.com', password_confirmation: 'yshmarov@gmail.com')
User.create!(email: 'yashm@outlook.com', password: 'yashm@outlook.com', password_confirmation: 'yashm@outlook.com')
User.create!(email: 'admin@example.com', password: 'admin@example.com', password_confirmation: 'admin@example.com')

3.times do
  Category.create!([{
    name: Faker::Job.title,
    description: Faker::Quote.famous_last_words,
  }])
end

9.times do
  Course.create!([{
    name: Faker::Job.title,
    description: Faker::Quote.famous_last_words,
    user_id: Faker::Number.between(from: 1, to: 3),
    category_id: Faker::Number.between(from: 1, to: 3),
  }])
end

90.times do
  Task.create!([{
    name: Faker::Address.unique.city,
    description: Faker::Quote.famous_last_words,
    video_url: "https://www.youtube.com/watch?v=ojXjR33bPOY",
    chapter: Faker::Number.between(from: 1, to: 10),
    course_id: Faker::Number.between(from: 1, to: 9),
  }])
end
