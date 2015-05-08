FactoryGirl.define do
  factory :auction do
    title Faker::Company.bs
    details Faker::Lorem.paragraph
    reserve_price 500
    ends_on Faker::Date.forward(30)
  end

end
