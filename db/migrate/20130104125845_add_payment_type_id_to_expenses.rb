class AddPaymentTypeIdToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :payment_type_id, :integer
  end
end
