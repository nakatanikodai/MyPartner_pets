FactoryBot.define do
  factory :post do
    partner {"chat"}
    title {"walking"}
    content{"hello"}
    user
  end
end