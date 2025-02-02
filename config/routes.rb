Rails.application.routes.draw do
  get '/studios', to: 'studios#index'
  get '/studios/:studio_id/movies', to: 'studio_movies#index'

  get '/movies/:id', to: 'movies#show'
  post '/movies/:movie_id/roles', to: 'roles#create'

end
