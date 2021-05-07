class AddFkToHeroPowers < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :hero_powers, :heroes
    add_foreign_key :hero_powers, :powers
  end
end
