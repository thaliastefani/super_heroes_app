class ChangeColumnsFromHeroes < ActiveRecord::Migration[6.1]
  def change
    remove_column :heroes, :name, :string, null: false
    remove_column :heroes, :real_name, :string

    add_column :heroes, :name, :string, limit: 200, null: false
    add_column :heroes, :real_name, :string, limit: 200
  end
end
