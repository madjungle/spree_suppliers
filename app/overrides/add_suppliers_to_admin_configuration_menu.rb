Deface::Override.new(:virtual_path => "spree/admin/configurations/index",
                     :name => "converted_admin_configurations_menu_286465532",
                     :insert_bottom => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
                     :text => "<%= configurations_menu_item(t('suppliers'), admin_suppliers_path, t('suppliers_description')) %>",
                     :disabled => false)

=begin
                     
    Admin::BaseController.class_eval do
      before_filter :add_product_supplier_tab, :add_suppliers_tab

      def add_suppliers_tab
        @order_admin_tabs << {:name => t('suppliers'), :url => "line_items_admin_order_suppliers_url"}
      end

      def add_product_supplier_tab
        @product_admin_tabs << {:name => t('suppliers'), :url => "selected_admin_product_suppliers_url"}
      end
    end

    Admin::ConfigurationsController.class_eval do
      before_filter :add_suppliers_link, :only => :index

      def add_suppliers_link
        @extension_links << {:link => admin_suppliers_url, :link_text => t('suppliers'), :description => t('suppliers_description')}
      end
    end

=end

