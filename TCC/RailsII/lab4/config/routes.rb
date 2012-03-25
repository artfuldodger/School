Lab4::Application.routes.draw do

  root :to => "stores#index"

  resources :users, only: [:new, :create]

  resources :stores do
    resources :items
  end

  match 'items/:id/mark_done' => 'items#toggle_done', as: 'item_toggle_done'

  get 'login' => "sessions#new"

  post 'login' => "sessions#create"

  get 'logout' => "sessions#destroy"

end
