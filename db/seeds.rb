Book.destroy_all

Book.create!(
  title: "Ruby Basics",
  author: "Matz",
  price: 29.99,
  published_year: 2024
)

Book.create!(
  title: "Rails Guide",
  author: "DHH",
  price: 39.99,
  published_year: 2023
)