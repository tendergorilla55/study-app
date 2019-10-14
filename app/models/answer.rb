class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :answer, optional: true

  validates :text, presence: true
end
