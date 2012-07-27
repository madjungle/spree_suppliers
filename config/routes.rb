Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resources :suppliers
    resources :products do
      resources :suppliers, :member => { :select => :post, :remove => :post }, :collection => { :available => :post, :selected => :get }
    end
    resources :orders do
      resources :suppliers, :collection => { :line_items => :get }
    end
  end
end
