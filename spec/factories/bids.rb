FactoryGirl.define do
  factory :bid do
    association :auction, factory: :auction
    amount 50
  end

end
