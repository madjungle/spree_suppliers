Spree::Product.class_eval do
  has_and_belongs_to_many :suppliers

  # For each Product, we keep track of each supplier's internal SKU,
  #   as well as the product cost and shipping cost for that particular Supplier
  # This data is kept in the join table, "products_suppliers"
  # We can access it through this association
  has_many :supplier_links, :class_name => "ProductSupplier"
end
