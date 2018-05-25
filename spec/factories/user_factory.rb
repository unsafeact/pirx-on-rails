FactoryBot.define do
  factory :user do
    sequence(:email){|n| "user#{n}@pirx.com" }
    password "123456"
    first_name "Peter"
    last_name "Example"
    admin false
    confirmed_at DateTime.now
  end

  factory :admin, class: User do
    sequence(:email){|n| "admin#{n}@pirx.com" }
    password "123456"
    admin true
    first_name "Admin"
    last_name "User"
  end

end
