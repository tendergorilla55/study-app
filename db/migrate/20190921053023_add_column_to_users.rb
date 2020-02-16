# frozen_string_literal: true

class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, before: :email
  end
end
