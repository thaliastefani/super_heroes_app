class AddFkToHeroPowers < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :hero_powers, :heroes, index: true
    add_foreign_key :hero_powers, :powers, index: true
  end
end
