class Agency < ApplicationRecord
  has_many :heroes

  validates :name, :email, presence: true

  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/, message: 'é inválido', allow_blank: true }
end
