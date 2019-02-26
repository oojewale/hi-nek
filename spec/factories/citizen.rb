FactoryBot.define do
  factory :citizen do
    user
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    gender { [0, 1].sample }
    dob { 19.years.ago }
    origin_city { Faker::Address.city }
    origin_state { Faker::Address.state }
    origin_street { Faker::Address.street_address }
    residence_city { Faker::Address.city }
    residence_state { Faker::Address.state }
    residence_street { Faker::Address.street_address }
    phone { '+2343000023242' }
    signature { Faker::Alphanumeric.alpha 2 }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/soccer.jpeg'), 'image/jpeg') }

    trait :under_age do
      dob { 14.years.ago }
    end

    factory :under_age_citizen, traits: [:under_age]
  end
end
