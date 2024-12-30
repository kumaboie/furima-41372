class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :states
  belongs_to :category
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :sucheduled_delivery
  has_one_attached :image
  belongs_to :user

  validates :title, presence: true, length: { maximum: 40 }
  validates :detail, presence: true, length: { maximum: 1000 }
  validates :image, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }

  validates :category_id, :states_id, :shipping_fee_status_id, :prefecture_id, :sucheduled_delivery_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
