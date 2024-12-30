class ShippingAddress < ApplicationRecord
  belongs_to :purchase

  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
  validates :city, presence: true
  validates :addresses, presence: true
  validates :building, 
  validates :phone_number, presence: true, format: {with: /\A[0-9]+\z/i, message: "is invalid. Input half-width characters."}
end

