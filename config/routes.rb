Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: "volumes#index"

  get 'volumes/search', to: 'volumes#search', as: 'volumes_search'
  get 'volumes/next_page', to: 'volumes#next_page', as: 'volumes_next_page'
  get 'volumes/previous_page', to: 'volumes#previous_page', as: 'volumes_previous_page'
  

end
