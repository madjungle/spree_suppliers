Deface::Override.new(:virtual_path => "spree/admin/shared/_configuration_menu",
                     :name => "add_suppliers_to_admin_sidebar_menu",
                     :insert_bottom => ".sidebar",
                     :text => "<%= configurations_sidebar_menu_item t(:suppliers), admin_suppliers_path %>",
                     :original => "29e0ab9c171ffab1988cb439b5d42300b78fe088")
