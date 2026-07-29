class Author < ApplicationRecord
  has_many :books

  validates :name, presence: true
  validates :email, presence: true
end