FactoryBot.define do
  factory :weight_record do
    user_id { 1 }
    weight { 80.0 }
    fat_percentage { 25.0 }
    measuring_date { "2020-01-01" }
  end
end
