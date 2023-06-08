class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.date :date_read
      t.integer :previous_reading
      t.integer :current_reading
      t.integer :balance
      t.boolean :paid
      t.date :date_paid

      t.timestamps
    end
  end
end
