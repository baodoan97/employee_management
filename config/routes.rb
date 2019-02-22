Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  get 'signup', to: 'users#new' # duong dan new chinh
  resources :users, except: [:new] # ngoai tru new
  resources :tasks
  # resources :tasks
  root 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  delete 'images', to:  'tasks#destroyimage'
end
