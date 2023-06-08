class AddForeignKeyToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_reference :clients, :employees, foreign_key: true
  end
end
