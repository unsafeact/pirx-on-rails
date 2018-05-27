FactoryBot.define do
  factory :product do
    sequence(:name){|n| "Product No. #{n}" }
    price Random.rand(100)
  end
end
