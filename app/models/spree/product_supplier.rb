# Represents a link from a Product to a Supplier
# Contains SKU, cost price, and shipping cost for that product
#   WHEN sourced by that supplier
# We also have Variant#sku, which is OUR internal SKU (not the supplier's)

module Spree
  class ProductSupplier < ActiveRecord::Base
    set_table_name "products_suppliers" # same table is used for has_and_belongs_to_many join table
    set_primary_key "id"

    belongs_to :supplier
    belongs_to :product

    validates_presence_of :product, :supplier
  end
end
