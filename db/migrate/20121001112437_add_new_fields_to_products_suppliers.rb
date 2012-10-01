class AddNewFieldsToProductsSuppliers < ActiveRecord::Migration
  def change
    add_column :products_suppliers, :sku, :string
    add_column :products_suppliers, :cost_price, :decimal, :precision => 8, :scale => 2
    add_column :products_suppliers, :shipping_cost, :decimal, :precision => 8, :scale => 2
  end
end
