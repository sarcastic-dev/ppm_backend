Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/home', to: 'homes#index'
  namespace :api do 
    devise_for :users, controllers: { registrations: 'registrations',
      sessions: 'sessions'}
  
    get '/users/all', to: 'users#index'
    put '/users/active/:id', to: 'users#active'
    resources :project_infos
    resources :met_mast_infos
    resources :turbine_infos
    resources :boom_sensor_infos
    resources :project_notes
    get '/get_check_list_items', to: 'check_lists#get_check_list_items'
    get '/download_pdf', to: 'project_infos#download_pdf'
    post '/create_note', to: 'check_lists#create_new_note'
  end
  post '/api/project_info', to: 'project_infos#create'
  post '/api/met_mast_info', to: 'met_mast_infos#create'
  post '/api/turbine_info', to: 'turbine_infos#create'
  post '/api/boom_sensor_info', to: 'boom_sensor_infos#create'
  post '/api/image_upload', to: 'boom_and_sensors#create'
  get '/api/get_user', to: 'boom_sensor_infos#get_user'
  post '/api/image_upload_api', to: 'boom_and_sensors#upload_image'
  
end