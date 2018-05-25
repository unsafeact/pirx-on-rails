FactoryBot.define do

  factory :comment do
    sequence(:body){|n| "Comment No. #{n}" }
    rating Random.rand(1...5)
    product
  end

  factory :product do
    sequence(:name){|n| "Product No. #{n}" }
    price Random.rand(100)

    factory :product_with_comments do

      transient do
        n_comments 3
      end

      after(:create) do |product, evaluator|
        create_list(:comment, evaluator.n_comments, product: product)
      end

    end
  end
end
