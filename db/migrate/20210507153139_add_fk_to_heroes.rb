class AddFkToHeroes < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :heroes, :genders
    add_foreign_key :heroes, :races
  end
end
