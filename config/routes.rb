Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tracks do
        collection do
          get :emo_songs
        end
      end
    end
  end
end
