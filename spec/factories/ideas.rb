FactoryBot.define do
  factory :idea do
    title { Faker::GreekPhilosophers.quote }
    description { Faker::Lovecraft.paragraph }
  end
end
