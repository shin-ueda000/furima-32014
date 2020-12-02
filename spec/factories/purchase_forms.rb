FactoryBot.define do
  factory :purchase_forme do
    postal_code { '123-4567' }
    shipping_area_id { 3 }
    municipalities { '横浜市緑区' }
    address { '青山１−１' }
    building_name {'柳ビル103'}
    phone_number { '00000000000' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
