Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  namespace 'admin' do
    resources 'users'
    root 'users#index'
  end

  namespace 'student' do
    get 'history', to: 'user#history'
    root 'user#index'
  end

  namespace 'staff' do
    resources 'users', only: [:index, :show, :update]
    resources 'salaries', except: [:new, :create]
    get 'salaries/pdf', to: 'salary#pdf'
    get 'history', to: 'user#history'
    get '/home', to: 'users#home'
    root 'users#home'
  end

  resources 'problems', only: [:index, :new, :create]

  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'
  get '/qa', to: 'home#qa'
  root 'home#index'
end