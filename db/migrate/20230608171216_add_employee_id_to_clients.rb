class AddEmployeeIdToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :employee_id, :integer
  end
end
