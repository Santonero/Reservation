class Reservation < ApplicationRecord
  validates :num_billet, presence: true, uniqueness: true
  validates :price, numericality: true
  validates :age, numericality: { allow_nil: true }
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid adress" }
  normalizes :email, with: -> email { email.downcase.gsub(/\s+/, "") }
end
