Rails.application.routes.draw do

    resources :songs
    patch 'songs/:id', to: 'songs#update'
end
