class Power < ApplicationRecord
  has_many :hero_powers
  has_many :heroes, through: :hero_powers

  validates :name, :code, presence: true
end
