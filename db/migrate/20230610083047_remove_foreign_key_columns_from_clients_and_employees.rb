class RemoveForeignKeyColumnsFromClientsAndEmployees < ActiveRecord::Migration[7.0]
  def change
    remove_column :clients, :employees_id
    remove_column :employees, :clients_id
  end
end
