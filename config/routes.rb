Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :currencies
  resources :pricings
  resources :unit_of_measures
  resources :items
  resources :customers
  resources :suppliers
  # Defines the root path route ("/")
  # root "articles#index"
end
