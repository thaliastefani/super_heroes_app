class AddAgencyFkToHero < ActiveRecord::Migration[6.1]
  def change
    add_reference :heroes, :agency, foreign_key: true, index: true
  end
end
