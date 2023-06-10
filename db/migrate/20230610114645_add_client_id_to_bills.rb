class AddClientIdToBills < ActiveRecord::Migration[7.0]
  def change
    add_column :bills, :client_id, :bigint, null: true

    # Optional: If you want to ensure data integrity, you can add a foreign key constraint
    add_foreign_key :bills, :clients, column: :client_id

    # Optional: If you want to remove any bills with invalid client_id values
    Bill.where.not(client_id: Client.pluck(:id)).destroy_all
  end
end
