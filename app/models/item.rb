class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :states
  belongs_to :category
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :sucheduled_delivery
  has_one_attached :image
  belongs_to :user
  has_one :purchase

  # 空の投稿を保存できないようにする
  validates :title, :detail, :price, presence: true

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :states_id, :shipping_fee_states_id, :prefecture_id, :sucheduled_delivery_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
