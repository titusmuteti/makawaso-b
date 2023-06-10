class LinkExistingEmployeesAndClientsUpdated < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO employee_clients (employee_id, client_id, created_at, updated_at)
      SELECT employees.id, clients.id, NOW(), NOW()
      FROM employees, clients
    SQL
  end

  def down
    # Add the necessary rollback operation if needed
  end
end
