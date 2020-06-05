5.times do
  Category.create(name: Faker::Science.element, priority: rand(1..5))
end

15.times do |n|
  email = "example-#{n+1}@microverse.org"
  User.create!(
    name: Faker::Name.first_name,
    email: email,
    password: 'password',
    password_confirmation: 'password'
  )
  user = User.find(n+1)
  user.articles.create!(title: Faker::Company.industry, text: Faker::Company.bs, image: "https://source.unsplash.com/random/800x600", category_list: Category.pluck(:name).sample)
end

5.times do |n|
  Vote.create!(user_id: (n + 1), article_id: 1)
end

10.times do |n|
  Vote.create!(user_id: (n + 1), article_id: (n + 2))
end
