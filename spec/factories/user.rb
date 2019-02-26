FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }

    trait :admin do
      admin { true }
    end

    factory :admin_user, traits: [:admin]
  end
end
