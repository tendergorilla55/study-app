class CreateWeightRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :weight_records do |t|
      t.references  :user, foreign_key: true
      t.integer     :weight, null: false
      t.integer     :fat_percentage
      t.date        :measuring_date, null: false
      t.timestamps
    end
  end
end
