Swap::Application.routes.draw do
  resources :event_invitations

  resources :groups

  post 'invitations', to: :invite_user, controller: :devise_users, as: :invitation_to_group

  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}, via: :get
  
  root :to => 'events#index'
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  get 'users/:id/groups/' => 'users#groups', as: "my_groups"
  resources :events
end
