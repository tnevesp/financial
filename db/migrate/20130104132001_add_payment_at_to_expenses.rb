class AddPaymentAtToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :payment_at, :date
  end
end
