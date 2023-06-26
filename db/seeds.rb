# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create([
  { name: "Emil1", email: "test@test.com", password: "123456" },
  { name: "Emil2", email: "magas3@gmail.com", password: "wheregems" },
  { name: "Emil3", email: "badabing@gmail.com", password: "badabang" },
  { name: "Emil4", email: "lukas@gmail.com", password: "111111" },
  { name: "Emil5", email: "aurimas@gmail.com", password: "111111" },
  { name: "Emil6", email: "darius@gmail.com", password: "111111" },
  { name: "Emil7", email: "vytas@gmail.com", password: "111111" }
])

friendships = Friendship.create([
  { user_id: 1, friend_id: 2, status: 'accepted' },
  { user_id: 1, friend_id: 6, status: 'pending' },
  { user_id: 1, friend_id: 7, status: 'pending' },
  { user_id: 2, friend_id: 3, status: 'accepted' },
  { user_id: 2, friend_id: 5, status: 'accepted' },
  { user_id: 2, friend_id: 7, status: 'pending' },
  { user_id: 3, friend_id: 4, status: 'pending' },
  { user_id: 3, friend_id: 6, status: 'cancelled' },
  { user_id: 4, friend_id: 6, status: 'pending' },
  { user_id: 5, friend_id: 6, status: 'cancelled' },
  { user_id: 6, friend_id: 7, status: 'pending' }
])

posts = Post.create([
  {user_id: 1, contents: 'Just found a hedgehog outside'},
  {user_id: 1, contents: 'Nevermind, lol'},
  {user_id: 2, contents: 'This is a post from second user'},
  {user_id: 3, contents: 'This is a post from third user'},
  {user_id: 4, contents: 'This is a post from fourth user'},
  {user_id: 5, contents: 'This is a post from fifth user'},
  {user_id: 6, contents: 'This is a post from sixth user'},
  {user_id: 7, contents: 'This is a post from seventh user'}
])

comments = Comment.create([
  {user_id: 2, post_id: 1, contents: 'Comment from second user'},
  {user_id: 2, post_id: 1, contents: 'Also comment from second user'},
  {user_id: 3, post_id: 1, contents: 'Comment from third user'},
  {user_id: 7, post_id: 2, contents: 'Comment from seventh user'}
])

likes = Like.create([
  {user_id: 1, post_id: 1},
  {user_id: 2, post_id: 1},
  {user_id: 3, post_id: 1},
  {user_id: 4, post_id: 1},
  {user_id: 1, post_id: 2},
  {user_id: 1, post_id: 3},
  {user_id: 1, post_id: 4},
  {user_id: 2, post_id: 3},
  {user_id: 2, post_id: 4},
  {user_id: 3, post_id: 4},
  {user_id: 4, post_id: 4},
  {user_id: 4, post_id: 4}
])
