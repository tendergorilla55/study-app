class CreateExpensesItems < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses_items do |t|
      t.string        :item_name, null: false
      t.integer       :price, null: false
      t.date          :purchase_date, null: false
      t.references    :user, foreign_key: true
      t.timestamps    null: true
    end
  end
end
