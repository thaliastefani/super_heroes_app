class Gender < ApplicationRecord
  has_many :heroes

  scope :female, -> { where(code: 2) }

  validates :name, :code, presence: true
end
