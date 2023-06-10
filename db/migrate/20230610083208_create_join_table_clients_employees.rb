class CreateJoinTableClientsEmployees < ActiveRecord::Migration[7.0]
  def change
    create_join_table :clients, :employees do |t|
      t.index [:client_id, :employee_id]
      t.index [:employee_id, :client_id]
    end
  end
end
