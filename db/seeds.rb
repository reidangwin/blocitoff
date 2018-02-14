# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

def create_users_with_todo_items(user_count, email_address=nil, password=nil)
  user_count.times do
    u = User.new(
      email: email_address || Faker::Internet.safe_email,
      password: password || Faker::Internet.password
    )
    u.skip_confirmation!

    10.times do
      t = Faker::MostInterestingManInTheWorld.quote
      u.items << Item.create({name: t})
    end
    u.save
  end
end

create_users_with_todo_items(10)

# Create a test account with familiar email address
create_users_with_todo_items(1, 'rangwin@gmail.com', 'password')

users = User.all
items = Item.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
