class WeightRecord < ApplicationRecord
  belongs_to :user

  validates :weight, presence: true
  validates :measuring_date, presence: true
end
