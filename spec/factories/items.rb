FactoryBot.define do
  factory :item do
    item_name {Faker::Lorem.sentence}
    description {Faker::Lorem.paragraph}
    association :user
    category_id {2}
    condition_id {2}
    postage_id {2}
    prefecture_id {2}
    shipping_day_id {2}
    price { 1000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
