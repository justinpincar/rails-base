StartupSignal::Application.routes.draw do
  ##################
  ### Web Routes ###
  ##################

  devise_for :users, :controllers => {
    :registrations => "users/registrations",
    :omniauth_callbacks => "users/omniauth_callbacks",
    :passwords => "users/password"
  }

  devise_scope :user do
    get 'users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end

  resources :admin, :only => [:index]
  namespace :admin do
    resources :pre_launch_subscribers, :only => [:index]
    resources :users, :only => [:index, :show] do
      collection do
        post :search
        get :goto
      end
      member do
        post :impersonate
      end
    end
  end

  resources :pre_launch_subscribers, :only => [:new, :create] do
    collection do
      get :subscribed
    end
  end

  match '/403' => 'errors#error403', :as => :error403
  match '/404' => 'errors#error404', :as => :error404
  match '/500' => 'errors#error500', :as => :error500

  root :to => "pre_launch_subscribers#new"
end

