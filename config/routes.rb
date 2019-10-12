Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  namespace 'admin' do
    resources 'users'
    root 'users#index'
  end

  namespace 'student' do
    get 'history', to: 'user#history'
    root 'user#index'
    get 'chart', to: 'user#chart'
  end

  namespace 'staff' do
    resources 'users', only: [:index, :show, :update]
    resources 'salaries', except: [:new, :create] do
      collection  do
        get :pdf 
      end  
    end   
    get 'history', to: 'user#history'
    get 'home', to: 'users#home'
    root 'users#home'
  end

  resources 'problems', only: [:index, :new, :create]

  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'
  get 'qa', to: 'home#qa'
end