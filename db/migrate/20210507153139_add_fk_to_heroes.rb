class AddFkToHeroes < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :heroes, :genders, index: true
    add_foreign_key :heroes, :races, index: true
  end
end
