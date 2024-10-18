FactoryBot.define do
  factory :reservation do
    name { Faker::Name.name }
    requested_capacity { 2 }
    reserve_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end
