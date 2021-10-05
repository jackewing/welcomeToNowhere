Rails
  .application
  .routes
  .draw do
    resources :tickets
    get '/wednesdays', to: 'eyegum#free_wednesdays'
    get '/otherevents', to: 'eyegum#other_events'
    get '/aboutus', to: 'eyegum#about_us'

    root to: 'eyegum#index'

    get '/welcometonowhere', to: 'welcome_to_nowhere#index'
    get '/welcometonowhere/artists/:id', to: 'artists#show'
  end
