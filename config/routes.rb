Rails.application.routes.draw do
namespace :api do
    namespace :v1 do
      resources :tracks, only: [:index]
      resources :users
      resources :playlists
      resources :votes, only: [:create, :show, :update, :destroy]
    end
  end
end
