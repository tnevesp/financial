class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :store_id
      t.decimal :cost, :precision => 10, :scale => 2
      t.string :comment

      t.timestamps
    end
  end
end
