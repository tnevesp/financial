class AddPaymentTypeIdToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :payment_type_id, :integer
    add_index :expenses, :payment_type_id
  end
end
