FactoryGirl.define do
  factory :post do
    title 'poo' * 5
    content 'purnima' * 2
    user
    category
  end
end
