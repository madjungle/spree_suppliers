Deface::Override.new(:virtual_path => "spree/admin/shared/_product_tabs",
                     :name => 'add_suppliers_to_admin_products',
                     :insert_bottom => "[data-hook='admin_product_tabs'], #admin_product_tabs[data-hook]",
                     :text => "<li<%== ' class=\"active\"' if current == 'Suppliers' %>>
                                 <%= link_to_with_icon 'icon-group', t(:suppliers),
                                     selected_admin_product_suppliers_path(@product) %>
                              </li>",
                     :original => '3801430748a019ba9c003cdf356289c7f9d98724')
