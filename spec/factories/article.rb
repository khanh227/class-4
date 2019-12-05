require 'faker'

FactoryBot.define do
  factory :article do
    title { Faker::String.random(length: 5) }
    text  { Faker::String.random }
  end
end