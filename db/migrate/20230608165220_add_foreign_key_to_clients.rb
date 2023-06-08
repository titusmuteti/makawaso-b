class AddForeignKeyToClients < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :clients, foreign_key: true
  end
end
