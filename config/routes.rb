UwharrieOffroad::Application.routes.draw do
  resources :users
  resources :trails do
    resources :comments
  end
  resources :comments do
    resources :comments
  end
  resources :password_resets
  resources :timings

  resource :session, :only => [:new, :create, :destroy]
  resource :account, :only => [:edit, :update], :controller => :users

  match 'reset_password' => 'password_resets#new'
  match 'signup'         => 'users#new'
  match 'logout'         => 'sessions#destroy'
  match 'login'          => 'sessions#new'
  match 'about'          => 'pages#about'
  match 'location'       => 'pages#location'
  root :to => "trails#index"
end
