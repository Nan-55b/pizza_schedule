FactoryBot.define do
  factory :schedule do
    title { "Sample Schedule" }
    body { "This is a sample schedule body." }
    association :user # ユーザーとの関連付け
  end
end
