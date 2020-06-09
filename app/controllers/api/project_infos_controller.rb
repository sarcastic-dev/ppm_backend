require 'prawn'

module Api
  class ProjectInfosController < ApplicationController

    skip_before_action :authorize_request
  
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

    def download_pdf

      project_info = ProjectInfo.find_by(id: params[:id])

      pdf = Prawn::Document.new
      pdf.text "Project Infomation", :align => :center, :size => 24, :styles => [:bold]
      pdf.text "\n \n Project Info : ", :size => 17, :styles => [:bold]
  

      if project_info.present?
        pdf.text "\nProject job no : #{project_info.project_job_no}", :size => 14
        pdf.text "Project date :  #{project_info.project_date}", :size => 14
        pdf.text "Project eng :   #{project_info.project_eng}", :size => 14
        pdf.text "Project support eng : #{project_info.project_support_eng}", :size => 14
        pdf.text "Project customer : #{project_info.project_customer}", :size => 14
        pdf.text "Project site name : #{project_info.project_site_name}", :size => 14
        pdf.text "Project rated capacity : #{project_info.project_rated_capacity}", :size => 14
        pdf.text "Project hub height : #{project_info.project_hub_height}", :size => 14
        pdf.text "Project rotor dia : #{project_info.project_rotor_dia}", :size => 14
        pdf.text "Project customer contact : #{project_info.project_customer_contact}", :size => 14
        pdf.text "Project mobile no: #{project_info.project_mobile_no}", :size => 14

        met_mast_info = MetMastInfo.find_by(mast_project_id: project_info.id)
        pdf.text "\n \n Met Mast Info : ", :size => 17, :styles => [:bold]
        if met_mast_info.present?

          pdf.text "\nMast name : #{met_mast_info.mast_name}", :size => 14
          pdf.text "Mast type : #{met_mast_info.mast_Type}", :size => 14
          pdf.text "Mast height : #{met_mast_info.mast_height}", :size => 14
          pdf.text "Mast dimension type1 x : #{met_mast_info.mast_dimension_type1_x}", :size => 14
          pdf.text "Mast dimension type2 x : #{met_mast_info.mast_dimension_type2_x}", :size => 14
          pdf.text "Mast dimension type3 x : #{met_mast_info.mast_dimension_type3_x}", :size => 14
          pdf.text "Mast dimension type1 y : #{met_mast_info.mast_dimension_type1_y}", :size => 14
          pdf.text "Mast dimension type2 y : #{met_mast_info.mast_dimension_type2_y}", :size => 14
          pdf.text "Mast dimension type3 y : #{met_mast_info.mast_dimension_type3_y}", :size => 14
          pdf.text "Mast dimension type1 value : #{met_mast_info.mast_dimension_type1_value}", :size => 14
          pdf.text "Mast dimension type2 value : #{met_mast_info.mast_dimension_type2_value}", :size => 14
          pdf.text "Mast dimension type3 value : #{met_mast_info.mast_dimension_type3_value}", :size => 14
          pdf.text "Mast no of segment type1 : #{met_mast_info.mast_no_of_segment_type1}", :size => 14
          pdf.text "Mast no of segment type2 : #{met_mast_info.mast_no_of_segment_type2}", :size => 14
          pdf.text "Mast no of segment type3 : #{met_mast_info.mast_no_of_segment_type3}", :size => 14
          pdf.text "Mast length of segment type1 : #{met_mast_info.mast_length_of_segment_type1}", :size => 14
          pdf.text "Mast length of segment type2 : #{met_mast_info.mast_length_of_segment_type2}", :size => 14
          pdf.text "Mast length of segment type3 : #{met_mast_info.mast_length_of_segment_type3}", :size => 14
          pdf.text "Mast total length : #{met_mast_info.mast_total_length}", :size => 14
          pdf.text "Mast primary mounting : #{met_mast_info.mast_primary_mounting}", :size => 14
          pdf.text "Mast coordinates x1 :  #{met_mast_info.mast_coordinates_x1}", :size => 14
          pdf.text "Mast coordinates x2 :  #{met_mast_info.mast_coordinates_x2}", :size => 14
          pdf.text "Mast coordinates x3 :  #{met_mast_info.mast_coordinates_x3}", :size => 14
          pdf.text "Mast coordinates x4 :  #{met_mast_info.mast_coordinates_x4}", :size => 14
          pdf.text "Mast coordinates x5 :  #{met_mast_info.mast_coordinates_x5}", :size => 14
          pdf.text "Mast coordinates y1 :  #{met_mast_info.mast_coordinates_y1}", :size => 14
          pdf.text "Mast coordinates y2 :  #{met_mast_info.mast_coordinates_y2}", :size => 14
          pdf.text "Mast coordinates y3 :  #{met_mast_info.mast_coordinates_y3}", :size => 14
          pdf.text "Mast coordinates y4 :  #{met_mast_info.mast_coordinates_y4}", :size => 14
          pdf.text "Mast coordinates y5 :  #{met_mast_info.mast_coordinates_y5}", :size => 14
          pdf.text "Mast avg coordinates x : #{met_mast_info.mast_avg_coordinates_x}", :size => 14
          pdf.text "Mast avg coordinates y : #{met_mast_info.mast_avg_coordinates_y}", :size => 14

        else
          pdf.text "\nNo Infomation found"
        end

        turbine_info = TurbineInfo.find_by(turbine_project_id: project_info.id)
        pdf.text "\n \n Turbine Info : ", :size => 17, :styles => [:bold]
        if turbine_info.present?

          pdf.text "\nTurbine id : #{turbine_info.turbine_id}", :size => 14
          pdf.text "Turbine date : #{turbine_info.turbine_date}", :size => 14
          pdf.text "Turbine make : #{turbine_info.turbine_make}", :size => 14
          pdf.text "Turbine type: #{turbine_info.turbine_type}", :size => 14
          pdf.text "Turbine name nearest town : #{turbine_info.turbine_name_nearest_town}", :size => 14
          pdf.text "Turbine distance nearest town : #{turbine_info.turbine_distance_nearest_town}" , :size => 14
          pdf.text "Turbine habitation : #{turbine_info.turbine_habitation}", :size => 14
          pdf.text "Turbine vegetation: #{turbine_info.turbine_vegetation}", :size => 14
          pdf.text "Turbine hub height : #{turbine_info.turbine_hub_height}", :size => 14
          pdf.text "Turbine coordinates x1 : #{turbine_info.turbine_coordinates_x1}", :size => 14
          pdf.text "Turbine coordinates x2 : #{turbine_info.turbine_coordinates_x2}", :size => 14
          pdf.text "Turbine coordinates x3 : #{turbine_info.turbine_coordinates_x3}", :size => 14
          pdf.text "Turbine coordinates x4 : #{turbine_info.turbine_coordinates_x4}", :size => 14
          pdf.text "Turbine coordinates x5 : #{turbine_info.turbine_coordinates_x5}", :size => 14
          pdf.text "Turbine coordinates y1 : #{turbine_info.turbine_coordinates_y1}", :size => 14
          pdf.text "Turbine coordinates y2 : #{turbine_info.turbine_coordinates_y2}", :size => 14
          pdf.text "Turbine coordinates y3 : #{turbine_info.turbine_coordinates_y3}", :size => 14
          pdf.text "Turbine coordinates y4 : #{turbine_info.turbine_coordinates_y4}", :size => 14
          pdf.text "Turbine coordinates y5 : #{turbine_info.turbine_coordinates_y5}", :size => 14
          pdf.text "Turbine avg coordinates x : #{turbine_info.turbine_avg_coordinates_x}", :size => 14
          pdf.text "Turbine avg coordinates y : #{turbine_info.turbine_avg_coordinates_y}", :size => 14
          pdf.text "Turbine distance mm and yy: #{turbine_info.turbine_distance_mm_and_yy}", :size => 14
          pdf.text "Turbine rotor dia : #{turbine_info.turbine_rotor_dia}", :size => 14
          pdf.text "Turbine coordinates wp1 : #{turbine_info.turbine_coordinates_wp1}", :size => 14
          pdf.text "Turbine coordinates wp2 : #{turbine_info.turbine_coordinates_wp2}", :size => 14
          pdf.text "Turbine coordinates wp3 : #{turbine_info.turbine_coordinates_wp3}", :size => 14
          pdf.text "Turbine coordinates wp4 : #{turbine_info.turbine_coordinates_wp4}", :size => 14
          pdf.text "Turbine coordinates wp5 : #{turbine_info.turbine_coordinates_wp5}", :size => 14

        else
          pdf.text "\nNo Infomation found"
        end

        boom_sensor_info = BoomSensorInfo.find_by(boom_project_id: project_info.id)
        pdf.text "\n \n Boom And Sensor Info : ", :size => 17, :styles => [:bold]

        if boom_sensor_info.present?
          pdf.text "\n Boom top anemometer hoz x : #{boom_sensor_info.boom_top_anemometer_hoz_x}", :size => 14 
          pdf.text "Boom top anemometer hoz y : #{boom_sensor_info.boom_top_anemometer_hoz_y}", :size => 14 
          pdf.text "Boom top anemometer ver x : #{boom_sensor_info.boom_top_anemometer_ver_x}", :size => 14 
          pdf.text "Boom top anemometer ver y : #{boom_sensor_info.boom_top_anemometer_ver_y}", :size => 14 
          pdf.text "Boom top anemometer height : #{boom_sensor_info.boom_top_anemometer_height}", :size => 14
          pdf.text "Boom mid anemometer hoz x : #{boom_sensor_info.boom_mid_anemometer_hoz_x}", :size => 14
          pdf.text "Boom mid anemometer hoz y : #{boom_sensor_info.boom_mid_anemometer_hoz_y}", :size => 14
          pdf.text "Boom mid anemometer ver x : #{boom_sensor_info.boom_mid_anemometer_ver_x}", :size => 14
          pdf.text "Boom mid anemometer ver y : #{boom_sensor_info.boom_mid_anemometer_ver_y}", :size => 14
          pdf.text "Boom mid anemometer height : #{boom_sensor_info.boom_mid_anemometer_height}", :size => 14
          pdf.text "Boom shear anemometer hoz x : #{boom_sensor_info.boom_shear_anemometer_hoz_x}", :size => 14
          pdf.text "Boom shear anemometer hoz y : #{boom_sensor_info.boom_shear_anemometer_hoz_y}", :size => 14
          pdf.text "Boom shear anemometer ver x : #{boom_sensor_info.boom_shear_anemometer_ver_x}", :size => 14
          pdf.text "Boom shear anemometer ver y : #{boom_sensor_info.boom_shear_anemometer_ver_y}", :size => 14
          pdf.text "Boom shear anemometer height : #{boom_sensor_info.boom_shear_anemometer_height}", :size => 14
          pdf.text "Boom propeller anemometer hoz x : #{boom_sensor_info.boom_propeller_anemometer_hoz_x}", :size => 14
          pdf.text "Boom propeller anemometer hoz y : #{boom_sensor_info.boom_propeller_anemometer_hoz_y}", :size => 14
          pdf.text "Boom propeller anemometer ver x : #{boom_sensor_info.boom_propeller_anemometer_ver_x}", :size => 14
          pdf.text "Boom propeller anemometer ver y : #{boom_sensor_info.boom_propeller_anemometer_ver_y}", :size => 14
          pdf.text "Boom propeller anemometer height : #{boom_sensor_info.boom_propeller_anemometer_height}", :size => 14
          pdf.text "Boom primary wind vane hoz x : #{boom_sensor_info.boom_primary_wind_vane_hoz_x}", :size => 14
          pdf.text "Boom primary wind vane hoz y : #{boom_sensor_info.boom_primary_wind_vane_hoz_y}", :size => 14
          pdf.text "Boom primary wind vane ver x : #{boom_sensor_info.boom_primary_wind_vane_ver_x}", :size => 14
          pdf.text "Boom primary wind vane ver y : #{boom_sensor_info.boom_primary_wind_vane_ver_y}", :size => 14
          pdf.text "Boom primary wind vane height : #{boom_sensor_info.boom_primary_wind_vane_height}", :size => 14
          pdf.text "Boom control wind vane hoz x : #{boom_sensor_info.boom_control_wind_vane_hoz_x}", :size => 14
          pdf.text "Boom control wind vane hoz y : #{boom_sensor_info.boom_control_wind_vane_hoz_y}", :size => 14
          pdf.text "Boom control wind vane ver x : #{boom_sensor_info.boom_control_wind_vane_ver_x}", :size => 14
          pdf.text "Boom control wind vane ver y : #{boom_sensor_info.boom_control_wind_vane_ver_y}", :size => 14
          pdf.text "Boom control wind vane height : #{boom_sensor_info.boom_control_wind_vane_height}", :size => 14
          pdf.text "Boom pressure sensor height : #{boom_sensor_info.boom_pressure_sensor_height}", :size => 14
          pdf.text "Boom temperature sensor height : #{boom_sensor_info.boom_temperature_sensor_height}", :size => 14
          pdf.text "Boom logger box height : #{boom_sensor_info.boom_logger_box_height}", :size => 14
        else
          pdf.text "\nNo Infomation found"
        end

        pdf.text "\n \n Wind Turbine CheckLists : ", :size => 17, :styles => [:bold]

        pdf.text "\nPhoto of Turbine : checked", :size => 14 
        pdf.text "Photo of Turbine Serial Number : checked", :size => 14 
        pdf.text "Photo of nearby Obstacles like Building, huts, water tanks and trees : checked", :size => 14 
        pdf.text "Photo of Tower Serial Number : checked", :size => 14 
        pdf.text "Panorama from Turbine Top : checked", :size => 14 
        pdf.text "Photo of Generator Serial Number : checked", :size => 14 
        pdf.text "Photo of Gearbox Serial Number : unchecked", :size => 14 
        pdf.text "Photo of Controller Versions : checked", :size => 14 
        pdf.text "Photo of CT and Power Transducer Serial Number : checked", :size => 14 
        pdf.text "Photo of CT Mounting : unchecked", :size => 14 
        pdf.text "Photo of Power Transducer Mounting : unchecked", :size => 14 
        pdf.text "Photo of Voltage Tapping point of Power Transducer : unchecked", :size => 14 
        pdf.text "Photo of Auxiliary supply tapping point of Power Transducer : unchecked", :size => 14 
        pdf.text "Photo of Status Signal points : unchecked", :size => 14 
        pdf.text "Photo of Data Logger Serial Number : checked", :size => 14 
        pdf.text "Photo of Data Logger : checked", :size => 14 
        pdf.text "Photo of Data Logger supply means : unchecked", :size => 14 
        pdf.text "Photo of Model and antenna : checked", :size => 14 
        pdf.text "Photo of Modem configuration : checked", :size => 14 
        pdf.text "Photo of Cable laying or wireless system : unchecked", :size => 14 

        pdf.text "\n\n Met Mast CheckLists : ", :size => 17, :styles => [:bold]

        pdf.text "\nPhoto of Met Mast : checked", :size => 14
        pdf.text "Panorama from Mast Top : checked", :size => 14
        pdf.text "Photo of Anemometer Serial Number : unchecked", :size => 14
        pdf.text "Photo of Wind Vane Serial Number : checked", :size => 14
        pdf.text "Photo of Temperature and Humidity serial number : checked", :size => 14
        pdf.text "Photo of pressure sensor serial Number : unchecked", :size => 14
        pdf.text "Photo of other sensors serial Number : checked", :size => 14
        pdf.text "Photo of Data Logger Serial Number : checked", :size => 14
        pdf.text "Photo of Anemometer Mounting : checked", :size => 14
        pdf.text "Photo of Wind Vane Mounting : unchecked", :size => 14
        pdf.text "Photo of Temperature and Humidity sensor mounting : unchecked", :size => 14
        pdf.text "Photo of Pressure sensor mounting : checked", :size => 14
        pdf.text "Photo of other sensors mounting : unchecked", :size => 14
        pdf.text "Photo of Solar Panel Mounting : checked", :size => 14
        pdf.text "Photo of Data Logger : checked", :size => 14
        pdf.text "Photo of Data Logger supply means : unchecked", :size => 14
        pdf.text "Photo of Model and antenna : unchecked", :size => 14
        pdf.text "Photo of Modem configuration : checked", :size => 14
        pdf.text "Photo of Cable laying or wireless system : checked", :size => 14
        
        project_note = ProjectNote.find_by(note_project_id: project_info.id)
        pdf.text "\n \n\n\n Project Note : ", :size => 17, :styles => [:bold]
        if project_note.present?
          pdf.text "\nNote : #{project_note.description}", :size => 14
        else
          pdf.text "\nNo note found"
        end

      else
        pdf.text "\nNo Infomation found"
      end
        
      send_data pdf.render, :filename => "#{project_info.project_job_no+"-"+project_info.project_date}.pdf", :type => "application/pdf"
 

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