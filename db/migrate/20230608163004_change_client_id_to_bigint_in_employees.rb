class ChangeClientIdToBigintInEmployees < ActiveRecord::Migration[7.0]
  def change
    change_column :employees, :client_id, :bigint
  end
end
