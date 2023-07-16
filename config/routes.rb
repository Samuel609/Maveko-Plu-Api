Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :currencies
  resources :pricings
  resources :unit_of_measures
  resources :items
  resources :customers
  resources :suppliers
  resources :users
  resources :notifications
  resources :customer_item_pricings
  resources :main_item_pricings
  resources :supplier_item_pricings
  resources :supplier_formulas
  resources :customer_formulas
  resources :supplier_item_requests
  resources :supplier_documents
  resources :currency_conversions
  resources :cross_references
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  # Defines the root path route ("/")
  # root "articles#index"
end
