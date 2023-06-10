class BillSerializer < ActiveModel::Serializer
  attributes :id, :date_read, :previous_reading, :current_reading, :balance, :paid, :date_paid

  belongs_to :client
end
