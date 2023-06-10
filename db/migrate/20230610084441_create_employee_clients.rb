class CreateEmployeeClients < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_clients do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
