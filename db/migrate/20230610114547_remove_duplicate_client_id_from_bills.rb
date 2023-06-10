class RemoveDuplicateClientIdFromBills < ActiveRecord::Migration[7.0]
  def change
    remove_column :bills, :client_id
  end
end
