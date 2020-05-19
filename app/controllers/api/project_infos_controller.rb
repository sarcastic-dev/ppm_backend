module Api
  class ProjectInfosController < ApplicationController
  
    def index
      project_infos = ProjectInfo.where(project_user_id: params[:user_id])
      if project_infos
        render json: { message: 'success', project_info_list: project_infos.as_json(except: [:created_at, :updated_at]) }, status: 200
      else
        render json: { message: 'No project listed, Add a project.' }, status: 400
      end
    end

    def show
      project_info = ProjectInfo.find_by(id: params[:id])
      if project_info
        render json: { message: 'success', project_info_data: project_info.as_json(except: [:created_at, :updated_at]) }, status: 200
      else
        render json: { message: 'No project listed, Add a project.' }, status: 400
      end
    end
  
    def create
      project_info = ProjectInfo.create(project_info_params)
      if project_info
        render json: { message: 'success', project_info_data: project_info.as_json(except: [:created_at, :updated_at])}, status: :ok
      else
        render json: { message: 'something went wrong' }, status: 400
      end
    end

    def update
      project_info = ProjectInfo.find_by(id: params[:id])
      if project_info.update(project_info_params)
        render json: { message: 'Updated successfully'}, status: :ok
      else
        render json: { message: 'something went wrong' }, status: 400
      end
    end

    def destroy
      project_info = ProjectInfo.find_by(id: params[:id])
      if project_info.present? && project_info.delete
        MetMastInfo.where(mast_project_id: params[:id]).delete_all
        TurbineInfo.where(turbine_project_id: params[:id]).delete_all
        BoomSensorInfo.where(boom_project_id: params[:id]).delete_all
        render json: { message: 'Deleted successfully'}, status: :ok
      else
        render json: { message: 'something went wrong' }, status: 400
      end
    end
  
    private
  
      def project_info_params
        params.permit(
         :project_user_id,
         :project_job_no,
         :project_date,
         :project_eng,
         :project_support_eng,
         :project_customer,
         :project_site_name,
         :project_rated_capacity,
         :project_hub_height,
         :project_rotor_dia,
         :project_customer_contact,
         :project_mobile_no
        )
      end
  
  end
end