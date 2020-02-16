FactoryBot.define do
  factory :weight_record do
    user_id { FactoryBot.create(:user).id }
    weight { 80.0 }
    fat_percentage { 25.0 }
    measuring_date { "2020-01-01" }
  end
end
