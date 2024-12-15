10.times do
  User.create!(name: Faker::Name.name,
              email: Faker::Internet.unique.email,
              password: "password")
end

user_ids = User.ids

10.times do |index|
  user = User.find(user_ids.sample)
  user.schedules.create!(title: "タイトル#{index}", body: "本文#{index}")
end