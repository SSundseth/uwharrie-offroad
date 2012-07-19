UwharrieOffroad::Application.routes.draw do
  resources :users
  resources :trails
  resources :password_resets

  resource :session, :only => [:new, :create, :destroy]
  resource :account, :only => [:edit, :update], :controller => :users

  match 'reset_password' => 'password_resets#new'
  match 'signup'         => 'users#new'
  match 'logout'         => 'sessions#destroy'
  match 'login'          => 'sessions#new'
  match 'about'          => 'pages#about'
  root :to => "trails#index"
end
