class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :token

  belongs_to :user
  has_one :shipping_address
  belongs_to :item
end
