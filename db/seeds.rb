# user
User.create!(user_name: "Test User",
             full_name: "Test Tarou",
             email: "test@test.com",
             website: "https://mobile.twitter.com",
             gender: 0,
             tel: "080-1234-5678",
             self_introduction: "よろしくお願いします！",
             password: "hogehoge",
             password_confirmation: "hogehoge")

50.times do |n|
  User.create!(user_name: "Test User No.#{n}",
               full_name: Faker::Name.name,
               email: "test#{n}@test.com",
               website: "https://mobile.twitter.com",
               gender: 1,
               tel: "#{n}-1234-5678",
               self_introduction: "No.#{n}です！よろしくお願いします！",
               password: "hogehoge",
               password_confirmation: "hogehoge")
end

# #post
# users = User.order(:created_at).take(10)
# users.each do |user|
#   30.times do |n|
#     user.posts.create!(content: "test post No.#{n}",
#                        pictures: open("#{Rails.root}/public/1.jpg"))
#   end
# end

#relationship
users = User.all
user = users.first
following = users[2..30]
followers = users[4..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
