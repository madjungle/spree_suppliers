class Spree::Admin::SuppliersController < Spree::Admin::ResourceController
  before_filter :load_data, :only => [:selected, :available, :remove, :new, :edit, :select, :update_data]

  def index
    @suppliers = Spree::Supplier.find(:all)
  end

  def new
    @supplier = Spree::Supplier.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @supplier = Spree::Supplier.find(params[:id])
  end

  def create
    @supplier = Spree::Supplier.new(params[:supplier])

    respond_to do |format|
      if @supplier.save
        flash.notice = flash_message_for(@supplier, :successfully_created)
        format.html { redirect_to admin_suppliers_path }
      else
        format.html { render :action => 'new' }
      end
    end
  end

  def update
    @supplier = Spree::Supplier.find(params[:id])

    respond_to do |format|
      if @supplier.update_attributes(params[:supplier])
        flash.notice = flash_message_for(@supplier, :successfully_updated)
        format.html { redirect_to admin_suppliers_path }
      else
        format.html { render :action => 'edit' }
      end
    end
  end

  def destroy
    @supplier = Spree::Supplier.find(params[:id])
    if @supplier.destroy
      flash.notice = flash_message_for(@supplier, :successfully_removed)
    end

    respond_to do |format|
      format.html { redirect_to admin_suppliers_path }
    end
  end

  def line_items
    @order = Spree::Order.find_by_number(params[:order_id])
  end

  # Show the Suppliers for a certain Product
  def selected
    @supplier_links = @product.supplier_links
  end

  def available
    if params[:q].blank?
      @available_suppliers = []
    else
      @available_suppliers = Spree::Supplier.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:q].downcase}%"])
    end
    @available_suppliers.delete_if { |supplier| @product.suppliers.include?(supplier) }
    respond_to do |format|
      format.html { render :layout => false }
    end
 end

  def remove
    @supplier = Spree::Supplier.find(params[:id])
    @product.suppliers -= [@supplier]
    @product.save
    @supplier_links = @product.supplier_links
    render :layout => false
  end

  def select
    @supplier = Spree::Supplier.find(params[:id])
    @product.suppliers << @supplier unless @product.suppliers.include?(@supplier)
    @product.save
    @supplier_links = @product.supplier_links
    render :layout => false
  end

  def update_data
    @supplier = Spree::Supplier.find(params[:id])
    @supplier_links = @product.supplier_links
    @link = @supplier_links.detect { |s| s.supplier == @supplier }
    @link.sku           = params[:sku]
    @link.cost_price    = strip_nonnumeric_chars(params[:cost_price]).to_d
    @link.shipping_cost = strip_nonnumeric_chars(params[:shipping_cost]).to_d
    @link.save
    render :layout => false
  end

  private

  def load_data
   default_country = Spree::Country.find Spree::Config[:default_country_id]
   @states = default_country.states.sort
   @product = Spree::Product.find_by_permalink(params[:product_id])
  end

  def strip_nonnumeric_chars(str)
    str.gsub(/[^\d.]+/,'')
  end
end
