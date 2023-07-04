class AddConfirmPasswordToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :confirm_password, :string
  end
end
