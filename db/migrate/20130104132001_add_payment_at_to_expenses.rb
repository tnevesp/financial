class AddPaymentAtToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :payment_at, :datetime
  end
end
