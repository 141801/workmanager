Rails.application.routes.draw do
  root to: 'pages#home'
  resources :worktimes
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'online', to: 'worktimes#online'
  post 'offline', to: 'worktimes#offline'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
