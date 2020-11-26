FactoryBot.define do
  factory :item do
    title                    {"test"}
    description_of_item      {"あああああ"}
    category_id              {2}
    product_condition_id     {2}
    shipping_charge_id       {2}
    shipping_area_id         {2}
    days_to_sip_id           {3}
    selling_price            {300}

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/gorira.png'), filename: 'test_image.png')
    end
  end
end
