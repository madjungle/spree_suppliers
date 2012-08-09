Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resources :suppliers
    resources :products do
      resources :suppliers do
      	member do
          post :select
          post :remove
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
