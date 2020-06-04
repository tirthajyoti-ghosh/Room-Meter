10.times do
  Category.create(name: Faker::Food.fruits, priority: rand(10))
end
