Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ok
  namespace :admin do
    resources 'users'
    root 'users#index'
  end
  
  # ok
  resources 'problems', only: [:index, :new, :create ,:show]

  # ok
  namespace 'student' do
    get 'history', to: 'user#history'
    root 'user#index'
  end
    
  namespace 'staff' do
    resources 'users', only: [:index, :new, :create]
    resources 'salaries'
    get 'history', to: 'user#history'
    root 'users#index'
  end


  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'
  get '/qa', to: 'home#qa'
  root 'home#index'
end