Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/shelters', to: 'shelter#index'
  get '/shelters/new', to: 'shelter#new'
  post '/shelters', to: 'shelter#create'
  get '/shelters/:id', to: 'shelter#id'
  get '/shelters/:id/edit', to: 'shelter#edit'
  patch '/shelters/:id', to: 'shelter#update'
  delete '/shelters/:id', to: 'shelter#delete'
  get '/shelters/:shelter_id/pets', to: 'shelter#pets'
  get '/shelters/:shelter_id/pets/new', to: 'shelter#new_pet'
  post '/shelters/:shelter_id/pets', to: 'shelter#create_pet'

  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#id'
end
