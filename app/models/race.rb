class Race < ApplicationRecord
  has_many :heroes

  validates :name, :code, presence: true
end
