Rails.application.routes.draw do

  root to: "flats#index"

    resources :flats do # generates all the routes
      collection do
        get :top  #/flats/top  flats#top
      end

      # member do
      #   # everything here it's going to be /flats/:id/...
      #   get :desciption # it's the same as `get '/flats/:id/description', to: 'restaurants#chef'`
      # end

      # when I use resources, I generate all the rest routes
      resources :reviews, only: [ :create, :destroy ]
      # POST '/flats/:flat_id/reviews/:id', to: 'reviews#create'
      # DELETE '/flats/:flat_id/reviews/:id', to: 'reviews#destroy'
  end
end
