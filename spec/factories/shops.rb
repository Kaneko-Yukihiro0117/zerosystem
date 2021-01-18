FactoryBot.define do
  factory :shop do
    item_name         { 'hugahoge' }
    store_name        { 'hogehuga' }
    detail            { Faker::Lorem.sentences }
    category_id       { 2 }
    latitude          { '111.1111111' }
    longitude         { '111.1111111' }

    association :user

    after(:build) do |shop|
      shop.image.attach(io: File.open('public/images/rabbit.png'), filename: 'rabbit.png')
      end
    end
  end

