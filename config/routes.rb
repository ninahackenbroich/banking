Rails.application.routes.draw do
  resources :accounts, shallow: true do
    resources :transactions
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
