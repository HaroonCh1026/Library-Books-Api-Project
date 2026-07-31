class AddFieldsToBooks < ActiveRecord::Migration[8.1]
  def change
    add_column :books, :description, :text
    add_column :books, :isbn, :string
    add_column :books, :genre, :string
    add_column :books, :language, :string
    add_column :books, :pages, :integer
    add_column :books, :stock, :integer
    add_column :books, :available, :boolean, default: true
  end
end