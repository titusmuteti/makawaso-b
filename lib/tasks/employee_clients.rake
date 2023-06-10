namespace :employee_clients do
  desc "Link existing employees and clients"
  task link_existing_data: :environment do
    Employee.find_each do |employee|
      client = Client.find_by(email: employee.email)
      EmployeeClient.create(employee: employee, client: client) if client.present?
    end
  end
end
