FactoryBot.define do
  factory :blog do
    title             { 'hugahuga' }
    plan              { Faker::Lorem.sentences }
    start_time        { '2020-12-12-11-59' }

    association :user
  end
end
