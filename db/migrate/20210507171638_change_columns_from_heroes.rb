class ChangeColumnsFromHeroes < ActiveRecord::Migration[6.1]
  def change
    change_column :heroes, :name, :string, limit: 200, null: false
    change_column :heroes, :real_name, :string, limit: 200
  end
end
