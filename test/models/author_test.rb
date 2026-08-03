require "test_helper"

class AuthorTest < ActiveSupport::TestCase
  test "author should not be valid without name" do
    author = Author.new(
      email: "test@example.com",
      phone: "03001234567",
      country: "Pakistan"
    )

    assert_not author.valid?
  end


test "author should be valid with correct data" do
  author = Author.new(
    name: "Haroon Riaz",
    email: "haroon.test@example.com",
    phone: "03001234567",
    country: "Pakistan"
  )

  assert author.valid?
end
end
