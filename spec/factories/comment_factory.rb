FactoryBot.define do

  factory :comment do
    sequence(:body){|n| "Comment No. #{n}" }
    rating Random.rand(1..5)
  end

end
