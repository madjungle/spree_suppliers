class SupplierSetup < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state_id
      t.string :zip_code
      t.string :phone
      t.string :fax
      t.string :email
      t.string :website
      t.text :notes

      t.timestamps
    end
    if ActiveRecord::Base.connection.tables.include?('products')
      add_column :products, :supplier_id, :integer
    elsif ActiveRecord::Base.connection.tables.include?('spree_products')
      add_column :spree_products, :supplier_id, :integer
    else
      raise 'Products table not found'
    end
  end

  def self.down
    drop_table :suppliers
    if ActiveRecord::Base.connection.tables.include?('products')
      remove_column :products, :supplier_id
    elsif ActiveRecord::Base.connection.tables.include?('spree_products')
      remove_column :spree_products, :supplier_id
    else
      raise 'Products table not found'
    end
  end
end
