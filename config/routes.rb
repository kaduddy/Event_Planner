Rails.application.routes.draw do
#USER
  post 'user_events/:user_id/:event_id' => 'user_events#create'

  delete '/user_events/:user_id/:event_id' => 'user_events#destroy'

#DISCUSSIONS
 
  post 'discussions/create'

#EVENTS
  get 'events/index'

  get 'events/new'

  post 'events/create'

  get 'events/:id' => 'events#show'

  get 'events/:id/edit' => 'events#edit'

  patch 'events/:id' => 'events#update'

  delete 'events/:id' => 'events#destroy'

#USERS
  get 'users' => 'users#index'

  get 'users/new'

  post 'users/create' => 'users#create'

  get 'users/:id' => 'users#show'

  get 'users/:id/edit' => 'users#edit'

  patch 'users/:id' => 'users#update'

  delete 'users/:id' => 'users#destroy'
#SESSIONS
  get 'sessions/new'

  post 'sessions/create'

  get 'sessions/destroy'


end
