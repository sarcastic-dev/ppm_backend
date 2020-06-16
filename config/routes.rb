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
    post '/create_checked_item_met_mast', to: 'check_lists#create_checked_item_met_mast'
    post '/create_checked_item_turbine', to: 'check_lists#create_checked_item_turbine'
    get '/find_check_status_met_mast', to: 'project_infos#find_check_status_met_mast'
    get '/get_checked_item_turbine/:id', to: 'check_lists#get_checked_item_turbine'
    get '/get_checked_item_met_mast/:id', to: 'check_lists#get_checked_item_met_mast'
    put '/update_checked_item_turbine/:id', to: 'check_lists#update_checked_item_turbine'
    put '/update_checked_item_met_mast/:id', to: 'check_lists#update_checked_item_met_mast'
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

# Server 
# ssh -i ppm-backend-dnvgl.pem ec2-user@ec2-18-191-241-137.us-east-2.compute.amazonaws.com