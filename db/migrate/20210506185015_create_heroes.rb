class CreateHeroes < ActiveRecord::Migration[6.1]
  def change
    create_table :heroes do |t|
      t.string :name, null: false
      t.string :real_name
      t.integer :height
      t.integer :weight
      t.date :birthday
      t.references :gender
      t.references :race
      t.timestamps
    end
  end
end
