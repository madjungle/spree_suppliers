class PrefixTablesWithSpree < ActiveRecord::Migration
  def change
    rename_table :suppliers, :spree_suppliers
  end
end
