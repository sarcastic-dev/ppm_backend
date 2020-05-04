class ProjectInfosController < ApplicationController

  before_action :authorize_request

  def create
    project_info = ProjectInfo.find_by(project_unique_id: params[:project_unique_id])
    if !project_info && ProjectInfo.create(project_info_params)
      render json: { message: 'Stored' }, status: :ok
    else
      render json: { message: 'something went wrong' }, status: 400
    end
  end

  private

    def project_info_params
      params.permit(
       :project_user_id,
       :project_unique_id,
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