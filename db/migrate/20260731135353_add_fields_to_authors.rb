class AddFieldsToAuthors < ActiveRecord::Migration[8.1]
  def change
    add_column :authors, :phone, :string
    add_column :authors, :bio, :text
    add_column :authors, :country, :string
    add_column :authors, :date_of_birth, :date
    add_column :authors, :active, :boolean, default: true
  end
end