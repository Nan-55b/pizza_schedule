FactoryBot.define do
  factory :user do
    name { "テストユーザー" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password" } # 生パスワードを設定
    crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt("password") } # 暗号化されたパスワードを設定
  end
end