Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :suppliers
    resources :products do
      resources :suppliers do
        member do
          get :select
          get :remove
          get :update_data # set SKU, cost price, and shipping cost
        end
        collection do
          post :available
          get :selected
        end
      end
    end
    resources :orders do
      resources :suppliers do
        collection do
          get :line_items
        end
      end
    end
  end
end
