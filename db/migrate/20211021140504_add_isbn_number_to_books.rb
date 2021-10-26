class AddIsbnNumberToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :ISBN_number, :string
    add_index :books, :ISBN_number, unique: true
  end
end
