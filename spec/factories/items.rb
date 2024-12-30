FactoryBot.define do
  factory :item do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/ダウンロード (1).jpeg'), 'image/jpeg') }
    title                  { '猫' }
    detail                 { '猫の里親を探しています' }
    price                  { 1000 }
    category_id            { Category.find(2).id }
    states_id              { States.find(2).id }
    shipping_fee_status_id { ShippingFeeStatus.find(2).id }
    prefecture_id          { Prefecture.find(2).id }
    sucheduled_delivery_id { SucheduledDelivery.find(2).id }

    association :user
  end
end
