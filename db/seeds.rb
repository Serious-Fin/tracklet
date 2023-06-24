# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create([
  { email: "test@test.com", password: "123456" },
  { email: "magas3@gmail.com", password: "wheregems" },
  { email: "badabing@gmail.com", password: "badabang" },
  { email: "lukas@gmail.com", password: "111111" },
  { email: "aurimas@gmail.com", password: "111111" },
  { email: "darius@gmail.com", password: "111111" },
  { email: "vytas@gmail.com", password: "111111" }
])

friendships = Friendship.create([
  { user_id: 1, friend_id: 2, status: 'accepted' },
  { user_id: 2, friend_id: 3, status: 'accepted' },
  { user_id: 2, friend_id: 5, status: 'accepted' },
  { user_id: 2, friend_id: 7, status: 'accepted' },
  { user_id: 3, friend_id: 4, status: 'pending' },
  { user_id: 3, friend_id: 6, status: 'cancelled' },
  { user_id: 4, friend_id: 6, status: 'pending' },
  { user_id: 5, friend_id: 6, status: 'cancelled' },
  { user_id: 6, friend_id: 7, status: 'accepted' }
])
