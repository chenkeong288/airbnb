Rails.application.routes.draw do
  root "listings#index"

  resources :payments
  
  resources :listings do
     resources :reservations
  end 

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end


  get "/user_reservations" => "reservations#user_reservations", as:  "user_reservations"          # reservation route
  post "listings/search" => "listings#search", as: "search"                                       # search route
  post "listings/autocomplete" => "listings#autocomplete", as: "autocomplete"                                  # autocomplete route


  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'payments/checkout'

end
