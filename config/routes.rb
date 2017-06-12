Rails.application.routes.draw do

  root to: 'cities#index'

  resources :cities do
    resources :items do 
      resources :locations
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
