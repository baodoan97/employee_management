Rails.application.routes.draw do
devise_for :adminmanas, :controllers => { :sessions => "adminmanas/sessions" }
authenticated :adminmanas do
  root to: "admins#index", :as => "authenticated_adminmanas_root"
end
  #devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new' # duong dan new chinh
  resources :users, except: [:new]# ngoai tru new
  resources :tasks
  #  resources :users, only: [:index]
  #get 'users/report'
  #post 'dangxuat',to:'adminmanas#sign_up'


  get 'admins/index', to: 'admins#index'
  get 'admins/user'
  post 'admins/adduser'
  get 'admins/admin'
  get 'admins/table'
  get 'error/oop'
  get 'admins/rend'
  #get 'admins/edit'

  #get 'admins/edit/:id', to: 'admins#edit', as: 'admins'
  #resouorce// collection/member: routes
resources :admins
namespace :error do
resources :oop
end
  # resources :tasks
 root to:'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  delete 'images', to:  'tasks#destroyimage'
  delete 'taskusers', to:  'tasks#removetaskuser'
  put 'change_status', to: 'tasks#change_status'
end
