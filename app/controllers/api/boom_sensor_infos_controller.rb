module Api
  class BoomSensorInfosController < ApplicationController

    def index
      boom_sensor_infos = BoomSensorInfo.where(boom_project_id: params[:id])
      if boom_sensor_infos
        render json: { message: 'success', data: boom_sensor_infos.as_json(except: [:created_at, :updated_at]) }, status: 200
      else
        render json: { message: 'No project listed, Add a project.' }, status: 400
      end
    end

    def show
      boom_sensor_info = BoomSensorInfo.find_by(boom_project_id: params[:id])
      if boom_sensor_info
        render json: { message: 'success', data: boom_sensor_info.as_json(except: [:created_at, :updated_at]) }, status: 200
      else
        render json: { message: 'No project listed, Add a project.' }, status: 400
      end
    end
  
    def create
      boom_sensor_info = BoomSensorInfo.find_by(boom_project_id: params[:id])
      if !boom_sensor_info && BoomSensorInfo.create(boom_sensor_info_params)
        render json: { message: 'Stored'}, status: :ok
      else
        render json: { message: 'something went wrong' }, status: 400
      end
    end

    def update
      boom_sensor_info = BoomSensorInfo.find_by(boom_project_id: params[:id])
      if boom_sensor_info.update(boom_sensor_info_params)
        render json: { message: 'Updated successfully'}, status: :ok
      else
        render json: { message: 'something went wrong' }, status: 400
      end
    end

  
    private
  
      def boom_sensor_info_params
        params.permit(
           :boom_project_id,
           :boom_top_anemometer_hoz_x,
           :boom_top_anemometer_hoz_y,
           :boom_top_anemometer_ver_x,
           :boom_top_anemometer_ver_y,
           :boom_top_anemometer_height,
           :boom_mid_anemometer_hoz_x,
           :boom_mid_anemometer_hoz_y,
           :boom_mid_anemometer_ver_x,
           :boom_mid_anemometer_ver_y,
           :boom_mid_anemometer_height,
           :boom_shear_anemometer_hoz_x,
           :boom_shear_anemometer_hoz_y,
           :boom_shear_anemometer_ver_x,
           :boom_shear_anemometer_ver_y,
           :boom_shear_anemometer_height,
           :boom_propeller_anemometer_hoz_x,
           :boom_propeller_anemometer_hoz_y,
           :boom_propeller_anemometer_ver_x,
           :boom_propeller_anemometer_ver_y,
           :boom_propeller_anemometer_height,
           :boom_primary_wind_vane_hoz_x,
           :boom_primary_wind_vane_hoz_y,
           :boom_primary_wind_vane_ver_x,
           :boom_primary_wind_vane_ver_y,
           :boom_primary_wind_vane_height,
           :boom_control_wind_vane_hoz_x,
           :boom_control_wind_vane_hoz_y,
           :boom_control_wind_vane_ver_x,
           :boom_control_wind_vane_ver_y,
           :boom_control_wind_vane_height,
           :boom_pressure_sensor_height,
           :boom_temperature_sensor_height,
           :boom_logger_box_height,
           :boom_panorama_picture_north,
           :boom_panorama_picture_north_west,
           :boom_panorama_picture_west,
           :boom_panorama_picture_south_west,
           :boom_panorama_picture_south,
           :boom_panorama_picture_south_east,
           :boom_panorama_picture_east,
           :boom_panorama_picture_north_east,
           :boom_panorama_picture_north_lat,
           :boom_panorama_picture_north_long,
           :boom_panorama_picture_north_west_lat,
           :boom_panorama_picture_north_west_long,
           :boom_panorama_picture_west_lat,
           :boom_panorama_picture_west_long,
           :boom_panorama_picture_south_west_lat,
           :boom_panorama_picture_south_west_long,
           :boom_panorama_picture_south_lat,
           :boom_panorama_picture_south_long,
           :boom_panorama_picture_south_east_lat,
           :boom_panorama_picture_south_east_long,
           :boom_panorama_picture_east_lat,
           :boom_panorama_picture_east_long,
           :boom_panorama_picture_north_east_lat,
           :boom_panorama_picture_north_east_long
          )
      end
  end
end

