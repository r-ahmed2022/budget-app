Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'devise/registrations',
    sessions: 'devise/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   #get '/categories', to: 'categories#index', as: 'categories'
  # Defines the root path route ("/")
   devise_scope :user do
    authenticated do
    root to: 'categories#index', as: 'user'
    end
    unauthenticated do
      root to: 'splash#index', as: 'unauthenticated_root'
    end
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

   resources :categories, only: %i[index new create] do
      resources :entities, only: %i[index new create]
  end


end