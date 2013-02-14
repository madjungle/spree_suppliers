Deface::Override.new(:virtual_path => "spree/admin/shared/_order_tabs",
                     :name => 'add_suppliers_tab_to_admin_orders',
                     :insert_bottom => "[data-hook='admin_order_tabs'], #admin_order_tabs[data-hook]",
                     :text => "<li<%== ' class=\"active\"' if current == 'Suppliers' %>>
                                 <%= link_to_with_icon 'icon-group', t(:suppliers),
                                     line_items_admin_order_suppliers_path(@order) %>
                              </li>",
                     :original => '1739e76fa785bcf1fe9897a9d179558a64570c78')
