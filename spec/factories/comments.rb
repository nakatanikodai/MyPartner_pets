FactoryBot.define do
  factory :comment do
    detail { "MyString" }
    user { nil }
    post { nil }
  end
end
