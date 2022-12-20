Rails.application.routes.draw do
  resources :marketplaces
  resources :inventories
  resources :items
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/login', to: "primary#login", as: "login"
  post '/login', to: "primary#log_out", as: "log_out"
  get '/main', to: "main#show_main", as: "main"
  post '/main', to: "primary#create", as: "login_create"
  get '/profile', to: "main#profile", as: "profile"
  get '/profile/old_password', to: "main#old_password", as: "old_password"
  post '/profile/old_password', to: "main#authen_password", as: "authen_password"
  get '/profile/new_password', to: "main#new_password", as: "new_password"
  post '/profile/new_password', to: "main#save_new_pass", as: "save_new_pass"
  get "/my_market", to: "market#my_market", as: "my_market"
  post "/my_market", to: "market#my_market2", as: "my_market2"
  get "/purchase_history", to: "history#purchase_history", as: "purchase_his"
  get "/sale_history", to: "history#sale_history", as: "sale_history"
  get "/my_inventory", to: "my_inventory#my_inventory", as: "my_inventory"
  post "/my_inventory", to: "my_inventory#my_inventory2", as: "my_inventory2"
  get "/my_inventory", to: "my_inventory#delete_item", as: "delete_item"
  post "/my_inventory", to: "my_inventory#change_ena", as: "change_enable"
  get "/my_inventory/add_inventory", to: "my_inventory#add_inventory", as: "add_invent"
  post "/my_inventory/add_inventory", to: "my_inventory#add_inventory2", as: "add_invent2"
  get "/top_seller", to: "seller#top_seller", as: "top_seller"
  post "/top_seller", to: "seller#gen_top_seller", as: "gen_top"
  get "/user_scaffold", to: "scaffold#user_scaffold", as: "user_scaffold"
  post "/user_scaffold", to: "scaffold#create_user", as: "create_user"
  get "/item_scaffold", to: "scaffold#item_scaffold", as: "item_scaffold"
  post "/item_scaffold", to:"scaffold#create_item", as: "create_item"
  # Defines the root path route ("/")
  # root "articles#index"
end
