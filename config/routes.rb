Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'devise/registrations',
    sessions: 'devise/sessions'
  }
  devise_scope :user do
    authenticated do
    root to: 'categories#index', as: 'user'
    end
    unauthenticated do
      root to: 'splash#index', as: 'unauthenticated_root'
    end
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
