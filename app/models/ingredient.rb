class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, uniqueness: true
  validates :name, presence: true

  # before_destroy :check_cocktail_presence

  # def check_cocktail_presence
  #   return false if location.mail_address.blank?
  # end
end
