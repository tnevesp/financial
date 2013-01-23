class AddStoreTypeIdToStores < ActiveRecord::Migration
  def change
  	add_column :stores, :store_type_id, :integer
  	add_index :stores, :store_type_id
  end
end
