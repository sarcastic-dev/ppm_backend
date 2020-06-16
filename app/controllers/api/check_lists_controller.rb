module Api
  class CheckListsController < ApplicationController

    def get_check_list_items
      wind_turbine_chkls = WindTurbineChkl.all.except(:id, :title)
      met_mast_chkls = MetMastChkl.all.except(:id, :title)
  
      if wind_turbine_chkls && met_mast_chkls
        render json: { wind_turbine: wind_turbine_chkls, met_mast: met_mast_chkls, message: 'Stored' },  status: :ok
      else
        render json: { message: 'something went wrong' },  status: 400
      end
    end

    def create_checked_item_met_mast
      project_checked_list_mast_mast = ProjectCheckedList.create(project_id: params[:project_id], title_checklist: params[:title_checklist], checklist_items: params[:checklist_items])
      if project_checked_list_mast_mast
        render json: { message: 'Stored' },  status: :ok
      end
    end

    def create_checked_item_turbine
      project_checked_list_turbine = ProjectCheckedList.create(project_id: params[:project_id], title_checklist: params[:title_checklist], checklist_items: params[:checklist_items])
      if project_checked_list_turbine
        render json: { message: 'Stored' },  status: :ok
      end
    end

    def get_checked_item_met_mast
      project_checked_list_met_mast = ProjectCheckedList.find_by(project_id: params[:id], title_checklist: "met_mast")
      if project_checked_list_met_mast
        render json: { data: project_checked_list_met_mast.as_json(except: [:created_at, :updated_at]), message: 'Checklist data' },  status: :ok
      else
        render json: { message: 'something went wrong' },  status: 400
      end
    end

    def get_checked_item_turbine
      project_checked_list_turbine = ProjectCheckedList.find_by(project_id: params[:id], title_checklist: "turbine")
      if project_checked_list_turbine
        render json: { data: project_checked_list_turbine.as_json(except: [:created_at, :updated_at]), message: 'Checklist data' },  status: :ok
      else
        render json: { message: 'something went wrong' },  status: 400
      end
    end

    def update_checked_item_met_mast
      project_checked_list_mast_mast = ProjectCheckedList.find_by(project_id: params[:id], title_checklist: "met_mast")
      if project_checked_list_mast_mast.update(project_id: params[:project_id], title_checklist: params[:title_checklist], checklist_items: params[:checklist_items])
        render json: { message: 'Updated successfully' },  status: :ok
      else
        render json: { message: 'something went wrong' }, status: 400
      end
    end

    def update_checked_item_turbine
      project_checked_list_turbine = ProjectCheckedList.find_by(project_id: params[:id], title_checklist: "turbine")
      if project_checked_list_turbine.update(project_id: params[:project_id], title_checklist: params[:title_checklist], checklist_items: params[:checklist_items])
        render json: { message: 'Updated successfully' },  status: :ok
      else
        render json: { message: 'something went wrong' }, status: 400
      end
    end

  end
end