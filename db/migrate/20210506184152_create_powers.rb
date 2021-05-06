class CreatePowers < ActiveRecord::Migration[6.1]
  def change
    create_table :powers do |t|
      t.string :name, null: false
      t.string :code, null: false
    end
  end
end
