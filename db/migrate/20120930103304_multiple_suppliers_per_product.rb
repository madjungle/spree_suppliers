class MultipleSuppliersPerProduct < ActiveRecord::Migration
  def up
    remove_column :spree_products, :supplier_id
    create_table :products_suppliers do |t|
      t.integer :product_id
      t.integer :supplier_id
    end
    add_index :products_suppliers, :product_id
    add_index :products_suppliers, :supplier_id
  end

  def down
    add_column :spree_products, :supplier_id
    drop_table :products_suppliers
  end
end
