class BoomSensorInfosController < ApplicationController

  def create
    boom_sensor_info = BoomSensorInfo.find_by(boom_project_id: params[:boom_project_id])
    if !boom_sensor_info && BoomSensorInfo.create(boom_sensor_info_params)
      render json: { message: 'Stored' }, status: :ok
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
      )
    end
end