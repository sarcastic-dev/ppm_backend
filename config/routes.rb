Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations',
                                    sessions: 'sessions'}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/home', to: 'homes#index'
  post '/api/project_info', to: 'project_infos#create'
  post '/api/met_mast_info', to: 'met_mast_infos#create'
  post '/api/turbine_info', to: 'turbine_infos#create'
  post '/api/boom_sensor_info', to: 'boom_sensor_infos#create'
  post '/api/image_upload', to: 'boom_and_sensors#create'
  get '/api/get_user', to: 'boom_and_sensors#get_user'
  post '/api/image_upload_api', to: 'boom_and_sensors#upload_image'
end