class TurbineInfosController < ApplicationController

  def create    
    turbine_info = TurbineInfo.find_by(turbine_project_id: params[:turbine_project_id])
    if !turbine_info && TurbineInfo.create(turbine_info_params)
      render json: { message: 'Stored' },  status: :ok
    else
      render json: { message: 'something went wrong' },  status: 400
    end
  end

  private

    def turbine_info_params
      params.permit(
         :turbine_project_id,
         :turbine_id ,
         :turbine_date, 
         :turbine_make ,
         :turbine_type,
         :turbine_name_nearest_town, 
         :turbine_habitation ,
         :turbine_vegetation,
         :turbine_hub_height ,
         :turbine_coordinates_x1, 
         :turbine_coordinates_x2,
         :turbine_coordinates_x3 ,
         :turbine_coordinates_x4 ,
         :turbine_coordinates_x5,
         :turbine_coordinates_y1 ,
         :turbine_coordinates_y2 ,
         :turbine_coordinates_y3,
         :turbine_coordinates_y4 ,
         :turbine_coordinates_y5 ,
         :turbine_avg_coordinates_x,
         :turbine_avg_coordinates_y ,
         :turbine_distance_mm_and_yy,
         :turbine_distance_nearest_town ,
         :turbine_rotor_dia ,
         :turbine_coordinates_wp1,
         :turbine_coordinates_wp2,
         :turbine_coordinates_wp3,
         :turbine_coordinates_wp4,
         :turbine_coordinates_wp5
      )
    end
end