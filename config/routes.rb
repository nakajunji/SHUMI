Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get 'home/top'
  root 'home#top'
  get 'home/about'
  resources :posts, only: %i[new create edit update destroy show index] do
    resources :favorites, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end
  resources :users, only: %i[edit update destroy show index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
