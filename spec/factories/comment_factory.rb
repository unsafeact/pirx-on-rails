FactoryBot.define do

  factory :comment do
    sequence(:body){|n| "Comment No. #{n}" }
    sequence(:user_id) {|n| n }
    sequence(:product_id) {|n| n }
    rating Random.rand(1..5)
  end

end
