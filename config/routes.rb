Shortener::Application.routes.draw do
  devise_for :users

  root :to => "home#index"

  resources :home, only: [:index]

  resources :urls, only: [:new, :create, :show ] do 
    collection do
      get 'popular'
    end
  end
end