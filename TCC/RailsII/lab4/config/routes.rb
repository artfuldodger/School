Lab4::Application.routes.draw do

  root :to => "stores#index"

  resources :users, only: [:new, :create]

  resources :stores do
    resources :items
  end

  get 'login' => "sessions#new"

  post 'login' => "sessions#create"

  get 'logout' => "sessions#destroy"

end
