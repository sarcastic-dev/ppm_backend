module Api
  class CheckListsController < ApplicationController

    def get_check_list_items
      wind_turbine_chkls = WindTurbineChkl.all.except(:id, :title)
      met_mast_chkls = MetMastChkl.all.except(:id, :title)
  
      if wind_turbine_chkls && met_mast_chkls
        data = {}
        render json: { wind_turbine: wind_turbine_chkls, met_mast: met_mast_chkls, message: 'Stored' },  status: :ok
      else
        render json: { message: 'something went wrong' },  status: 400
      end
    end

    def create_checked_
      
    end


  end
end