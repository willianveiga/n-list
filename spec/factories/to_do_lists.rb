# frozen_string_literal: true

FactoryBot.define do
  factory :to_do_list do
    name { Faker::Lorem.sentence }
  end
end
