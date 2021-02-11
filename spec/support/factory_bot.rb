RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do
  factory :member do
    sequence(:name) {|n| "Member#{n}"}
    sequence(:skill_level) {|n| n}
    premium_member {true}
  end

  factory :orv do
    sequence(:name) {|n| "Member#{n}"}
    sequence(:make) {|n| "Make#{n}"}
    sequence(:model) {|n| "Model#{n}"}
    sequence(:model) {|n| n}
    passed_safety_inspection {true}
  end
end
