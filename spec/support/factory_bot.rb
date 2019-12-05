RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do
  factory :article do
    title { "Title" }
    text  { "Text" }
  end
end