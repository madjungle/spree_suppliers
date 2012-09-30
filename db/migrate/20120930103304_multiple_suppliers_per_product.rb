class MultipleSuppliersPerProduct < ActiveRecord::Migration
  def change
    remove_column :spree_products, :supplier_id
    create_table :products_suppliers, :id => false do |t|
      t.integer :product_id
      t.integer :supplier_id
    end
    add_index :spree_products_suppliers, :product_id
    add_index :spree_products_suppliers, :supplier_id
  end
end
