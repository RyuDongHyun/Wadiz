Rails.application.routes.draw do
  root 'movies#index'

  get 'movies/new'

  get 'movies/create'

  get 'movies/show/:id' => 'movies#show'
  
  get 'movies/:id/review' => 'movies#review'
end
