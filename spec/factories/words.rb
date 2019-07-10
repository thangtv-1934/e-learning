FactoryBot.define do
  factory :word do
    name {FactoryBot::Name.name}
    meaning {FactoryBot::Name.name}
    speech {FactoryBot::Name.name}
    example {FFaker::Lorem.characters 10}
  end
end
