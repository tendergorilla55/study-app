# frozen_string_literal: true

class ExpensesItem < ApplicationRecord
  belongs_to :user

  validates :item_name, presence: true
  validates :price, presence: true
end
