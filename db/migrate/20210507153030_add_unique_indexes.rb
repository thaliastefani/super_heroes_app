class AddUniqueIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :genders, :code, unique: true
    add_index :races, :code, unique: true
    add_index :powers, :code, unique: true
  end
end
