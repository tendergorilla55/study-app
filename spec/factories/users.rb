FactoryBot.define do
  factory :user do
    name { "ホゲ太郎" }
    email { "hoge@example.com" }
    password { "aaaaaa" }
    password_confirmation { "aaaaaa" }
  end
end
