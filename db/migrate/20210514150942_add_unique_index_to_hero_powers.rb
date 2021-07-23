class AddUniqueIndexToHeroPowers < ActiveRecord::Migration[6.1]
  def change
    add_index :hero_powers, [:hero_id, :power_id], unique: true
  end
end
