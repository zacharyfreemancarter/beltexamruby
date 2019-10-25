Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '' => "sessions#new"
  get 'main' => "sessions#new"
  post 'sessions' => "sessions#create"
  get 'logout' => "sessions#logout"

  post 'users' => "users#create"
  get 'users/:id' => "users#show"

  post 'users/:id/songs' => "songs#create"
  get 'songs' => "songs#index"
  get 'songs/:song_id' => "songs#show"

  post '/songs/:song_id/users/:id/add_to_playlist' => "playlists#create"
end
