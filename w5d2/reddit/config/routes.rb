Rails.application.routes.draw do

  resources :comments, only: [:create, :show]

  resources :posts, except: [:index] do
    resources :comments, only: [:new]
  end
  resources :subs, except: [:destroy]

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
