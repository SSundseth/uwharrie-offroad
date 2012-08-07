UwharrieOffroad::Application.routes.draw do
  resources :users, :except => [:show, :index]

  resources :trails, :only => [:show, :index] do
    resources :comments, :except => [:index]
  end

  resources :comments, :only => [:edit, :update] do
    resources :comments, :only => [:new, :create]
  end
  resources :password_resets, :only => [:new, :create]
  resources :timings, :only => [:new, :create]

  resource :session, :only => [:new, :create, :destroy]

  match 'reset_password' => 'password_resets#new'
  match 'signup'         => 'users#new'
  match 'logout'         => 'sessions#destroy'
  match 'login'          => 'sessions#new'
  match 'about'          => 'pages#about'
  match 'user/:name'     => 'users#show'

  root :to => "trails#index"
end
