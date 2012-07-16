UwharrieOffroad::Application.routes.draw do
  resources :users
  resource :session, :only => [:new, :create, :destroy]
  resource :account, :only => [:edit, :update], :controller => :users

  match 'signup' => 'users#new'
  match 'logout' => 'sessions#destroy'
  match 'login'  => 'sessions#new'
  root :to => "users#index"
end
