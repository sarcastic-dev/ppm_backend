module Api
  class MetMastInfosController < ApplicationController

    def index
      met_mast_infos = MetMastInfo.where(mast_project_id: params[:id])
      if met_mast_infos
        render json: { message: 'success', data: met_mast_infos.as_json(except: [:created_at, :updated_at]) }, status: 200
      else
        render json: { message: 'No project listed, Add a project.' }, status: 400
      end
    end

    def show
      met_mast_info = MetMastInfo.find_by(mast_project_id: params[:id])
      if met_mast_info
        render json: { message: 'success', data: met_mast_info.as_json(except: [:created_at, :updated_at]) }, status: 200
      else
        render json: { message: 'No project listed, Add a project.' }, status: 400
      end
    end
  
    def create    
      met_mast_info = MetMastInfo.find_by(mast_project_id: params[:id])
      if !met_mast_info && MetMastInfo.create(met_mast_params)
        render json: { message: 'Stored' },  status: :ok
      else
        render json: { message: 'something went wrong' },  status: 400
      end
    end

    def update
      met_mast_info = MetMastInfo.find_by(mast_project_id: params[:id])
      if met_mast_info.update(met_mast_params)
        render json: { message: 'Updated successfully', data: met_mast_info.as_json(except: [:created_at, :updated_at])}, status: :ok
      else
        render json: { message: 'something went wrong' }, status: 400
      end
    end
  
    private
  
      def met_mast_params
        params.permit(
        :mast_project_id,
        :mast_name,
        :mast_Type,
        :mast_height, 
        :mast_dimension_type1_x, 
        :mast_dimension_type2_x,
        :mast_dimension_type3_x,
        :mast_dimension_type1_y,
        :mast_dimension_type2_y,
        :mast_dimension_type3_y, 
        :mast_dimension_type1_value, 
        :mast_dimension_type2_value,
        :mast_dimension_type3_value,
        :mast_no_of_segment_type1, 
        :mast_no_of_segment_type2,
        :mast_no_of_segment_type3,
        :mast_length_of_segment_type1, 
        :mast_length_of_segment_type2,
        :mast_length_of_segment_type3, 
        :mast_total_length, 
        :mast_primary_mounting,
        :mast_coordinates_x1, 
        :mast_coordinates_x2, 
        :mast_coordinates_x3,
        :mast_coordinates_x4,
        :mast_coordinates_x5, 
        :mast_coordinates_y1,
        :mast_coordinates_y2, 
        :mast_coordinates_y3, 
        :mast_coordinates_y4,
        :mast_coordinates_y5, 
        :mast_avg_coordinates_x, 
        :mast_avg_coordinates_y)
      end
  end
  
end