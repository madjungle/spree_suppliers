class Spree::Admin::SuppliersController < Spree::Admin::BaseController
#  before_filter :load_data, :only => [:selected, :available, :remove, :new, :edit, :select]

  before_filter :load_data, :only => [:new, :edit]

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

#  def selected
#    @supplier = @product.supplier
#  end
#
#  def available
#    if params[:q].blank?
#      @available_suppliers = []
#    else
#      @available_suppliers = Supplier.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:q].downcase}%"])
#    end
#    @available_suppliers.delete_if { |supplier| @product.supplier == supplier }
#    respond_to do |format|
#      format.html
#      format.js { render :layout => false }
#    end
#  end
#
#  def remove
#    @product.supplier = nil
#    @product.save
#    @supplier = @product.supplier
#    render :layout => false
#  end
#
#  def select
#    @supplier = Supplier.find_by_param!(params[:id])
#    @product.supplier = @supplier
#    @product.save
#    @supplier = @product.supplier
#    render :layout => false
#  end
#
#  update.after do
#    Rails.cache.delete('suppliers')
#  end
#
#  create.after do
#    Rails.cache.delete('suppliers')
#  end

  private

  def load_data
   default_country = Spree::Country.find Spree::Config[:default_country_id]
   @states = default_country.states.sort
   @product = Spree::Product.find_by_permalink(params[:product_id])
  end
end
