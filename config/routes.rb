Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',  # Controller for sign-in
    registrations: 'users/registrations'  # Controller for sign-up
  }
  root 'home#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
end
