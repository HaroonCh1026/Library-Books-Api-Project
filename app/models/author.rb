class Author < ApplicationRecord
  # Associations
  has_many :books, dependent: :destroy

  # Validations
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }

  validates :email,
            presence: true,
            uniqueness: true

  validates :phone,
            presence: true,
            length: { is: 11 }

  validates :country, presence: true

  validates :bio,
            length: { maximum: 500 },
            allow_blank: true

  # Callbacks - Active Record

  before_validation :format_email
  before_save :format_name
  after_create :author_created

  private

  def format_email
    self.email = email.downcase.strip if email.present?
  end

  def format_name
    self.name = name.titleize if name.present?
  end

  def author_created
    puts "Author '#{name}' created successfully."
  end
end
