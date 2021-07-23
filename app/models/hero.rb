class Hero < ApplicationRecord
  before_save :format_fields

  belongs_to :gender
  belongs_to :race
  belongs_to :agency, optional: true

  has_many :hero_powers
  has_many :powers, through: :hero_powers

  scope :heroines, -> { joins(:gender).merge(Gender.female) }
  scope :with_power, -> (power) { joins(:powers).where(powers: {code: power}) }
  scope :sort_name, -> { order(:name) }
  scope :order_by_name_with_includes, -> { includes(:gender, :race, :powers, :agency).sort_name }
  scope :has_agency, -> { where.not(agency: nil) }
  scope :get_id_and_name, -> { select(:id, :name).sort_name }

  validates :name, uniqueness: true
  validates :real_name, uniqueness: { allow_blank: true }

  validates :name, :race, :gender, presence: true

  validates :name, :real_name, length: { maximum: 200 }

  validates :weight, :height, numericality: { only_integer: true, allow_blank: true }

  validate :birthday_cannot_be_in_future
  validate :birthday_valid

  private

  def birthday_cannot_be_in_future
    errors.add(:birthday, "can't be in the future") if birthday.present? && birthday.future?
  end

  def birthday_valid
    errors.add(:birthday, "is invalid") if !date_parse?
  end

  def date_parse?
    begin
      Date.parse(birthday.to_s) if birthday.present?
    rescue ArgumentError
      false
    end
  end

  def format_fields
    self.name = name.gsub(/[^0-9A-Za-z\s]/, '').upcase.squeeze(" ") if attribute_present?(:name)
    self.real_name = real_name.gsub(/[^0-9A-Za-z\s]/, '').upcase.squeeze(" ") if attribute_present?(:real_name)
    true
  end
end
