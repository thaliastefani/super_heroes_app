class CreateHeroPowers < ActiveRecord::Migration[6.1]
  def change
    create_table :hero_powers do |t|
      t.references :hero
      t.references :power
      t.timestamps
    end
  end
end
