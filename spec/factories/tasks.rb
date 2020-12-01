# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    content { Faker::Lorem.sentence }
    position { Faker::Number.digit }

    trait :done do
      done { true }
    end

    trait :incomplete do
      done { false }
    end
  end
end
