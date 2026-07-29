Book.destroy_all
Author.destroy_all

author = Author.create!(
  name: "haroon",
  email: "haroon@example.com"
)

Book.create!(
  title: "Ruby Basics",
  price: 100,
  published_year: 2024,
  author: author
)

Book.create!(
  title: "Rails API",
  price: 200,
  published_year: 2025,
  author: author
)

puts "Seed data added!"