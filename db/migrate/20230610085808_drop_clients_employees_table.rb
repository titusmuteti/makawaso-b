class DropClientsEmployeesTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :clients_employees
  end

  def down
    create_table :clients_employees do |t|
      t.references :client, foreign_key: true
      t.references :employee, foreign_key: true
      t.timestamps
    end
  end
end
