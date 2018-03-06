Rails.application.routes.draw do
  root "listings#index"

  # resources :payments 
  
  resources :listings do
     resources :reservations
  end 

  #default code written by Rails
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  #self-written routes
  get "/user_reservations" => "reservations#user_reservations", as:  "user_reservations"                               # reservation route
  get "/listings/:listing_id/reservations/:id/payments/new" => "payments#new", as: "new_payment"                       # payment route       (*Note :listing_id and :id in the url enables Rails to know and remember the new payment is for which reservation under which listing and which user.)
  post "/listings/:listing_id/reservations/:id/payments" => "payments#create"                                          # payment route
  post "/listings/:listing_id/reservations/:id/payments/checkout" => "payments#checkout", as: "payments_checkout"      # payment route
  post "listings/search" => "listings#search", as: "search"                                                            # search route
  post "listings/autocomplete" => "listings#autocomplete", as: "autocomplete"                                          # autocomplete route


  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'payments/checkout'

end
