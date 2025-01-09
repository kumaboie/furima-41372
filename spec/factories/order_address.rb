FactoryBot.define do
  factory :order_address do
    postal_code { '444-4444' }
    prefecture_id { Prefecture.find(2).id }
    city { '豊田市' }
    addresses { '１−１' }
    building { '愛知ビル' }
    phone_number { '1234567891' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
