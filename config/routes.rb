Rails.application.routes.draw do
  #resources :volumes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: "volumes#index"

  get 'volumes/search', to: 'volumes#search', as: 'volumes_search'
  

end
