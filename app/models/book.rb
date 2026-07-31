class Book < ApplicationRecord
  # Associations
  belongs_to :author


  # Validations
  validates :title,
            presence: true,
            length: { minimum: 3, maximum: 100 }

  validates :description,
            length: { maximum: 1000 },
            allow_blank: true

  validates :isbn,
            presence: true,
            uniqueness: true

  validates :genre, presence: true

  validates :language, presence: true

  validates :pages,
            numericality: { greater_than: 0 }

  validates :price,
            numericality: { greater_than: 0 }

  validates :published_year,
            numericality: { greater_than: 1900 }

  validates :stock,
            numericality: { greater_than_or_equal_to: 0 }

  # Callbacks
  before_save :format_title
  before_create :book_created
  after_update :book_updated

  private

  def format_title
    self.title = title.titleize if title.present?
  end

  def book_created
    puts "Creating '#{title}'..."
  end

  def book_updated
    puts "'#{title}' updated successfully."
  end
end
