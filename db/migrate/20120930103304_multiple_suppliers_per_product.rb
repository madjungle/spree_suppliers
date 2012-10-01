class MultipleSuppliersPerProduct < ActiveRecord::Migration
  def change
    remove_column :spree_products, :supplier_id
    create_table :products_suppliers do |t|
      t.integer :product_id
      t.integer :supplier_id
    end
    add_index :products_suppliers, :product_id
    add_index :products_suppliers, :supplier_id
  end
end
