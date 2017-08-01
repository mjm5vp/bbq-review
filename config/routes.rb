Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # get '/', to: 'application#home'
  root to: 'cities#index'



  resources :cities do
    resources :items do
      resources :locations do

        member do
          post 'add_gold'
          delete 'remove_favorite'
        end

        member do
          post 'add_silver'
          delete 'remove_favorite'
        end

        member do
          post 'add_bronze'
          delete 'remove_favorite'
        end

        resources :comments

    end
  end
end

# The member block creates two custom routes for songs that correspond with controller actions of the same name.

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
