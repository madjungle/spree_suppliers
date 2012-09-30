class Spree::Supplier < ActiveRecord::Base
  attr_accessible :name, :address1, :address2, :city, :state_id, :zip_code, :phone, :fax, :email, :website, :notes

  belongs_to :state, :class_name => "Spree::State"
  has_and_belongs_to_many :products
end
