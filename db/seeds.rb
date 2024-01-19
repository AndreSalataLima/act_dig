# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# 5 Users
5.times do |i|
  User.create(
    name: "User #{i + 1}",
    age: 20 + i,
    weight: 60 + i * 5,
    height: 170 + i,
    level: "beginner",
    objective: "fitness"
  )
end

# 5 Sessions for each user
User.all.each do |user|
  5.times do |i|
    user.sessions.create(
      timestamp: Time.now - i.days,
    )
  end
end

# 5 exercises for each session
Session.all.each do |session|
  5.times do |i|
    session.exercises.create(
      machine: "machine #{i + 1}",
      duration: Time.now,
      weight: 10 + i,
      repetition: 10 + i,
      serie: 10 + i
    )
  end
end

# 1 sensor for each exercise
Exercise.all.each do |exercise|
  exercise.create_sensor(
    distance: 10,
    speed: 10,
    time: Time.now
  )
end
