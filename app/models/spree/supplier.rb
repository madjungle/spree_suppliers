class Spree::Supplier < ActiveRecord::Base
  belongs_to :state, :class_name => "Spree::State"
  has_many :products
end
