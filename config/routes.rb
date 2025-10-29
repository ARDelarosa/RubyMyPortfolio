Rails.application.routes.draw do
  get 'contact/index'
  get 'about/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#welcome"
  get "portfolio", to: "pages#portfolio"
  get "about", to: "about#index"
  get "contact", to: "contact#index"
  post "contact", to: "contact#create"
end
