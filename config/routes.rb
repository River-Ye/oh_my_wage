Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  resource 'student', except: [:destroy, :edit, :update] do
    resources 'problems', only: [:index, :new, :create]
    collection do
      get 'history'
    end
  end
    
  resource 'staff' do
    resources 'problems', only: [:index, :new, :create]
    collection do
      get 'history'
    end
  end

  resource 'admin' do
    resources 'users' do
    end
  end

  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'
  get '/qa', to: 'home#qa'
  root 'home#index'
end