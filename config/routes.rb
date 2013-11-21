Swap::Application.routes.draw do
  resources :groups

  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}, via: :get
  
  root :to => 'calendar#index'
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :events
end
