class CreateTurbineInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :turbine_infos do |t|
      t.string :turbine_project_id
      t.string :turbine_id 
      t.string :turbine_date 
      t.string :turbine_make 
      t.string :turbine_type
      t.string :turbine_name_nearest_town 
      t.string :turbine_habitation 
      t.string :turbine_vegetation
      t.string :turbine_hub_height 
      t.string :turbine_coordinates_x1 
      t.string :turbine_coordinates_x2
      t.string :turbine_coordinates_x3 
      t.string :turbine_coordinates_x4 
      t.string :turbine_coordinates_x5
      t.string :turbine_coordinates_y1 
      t.string :turbine_coordinates_y2 
      t.string :turbine_coordinates_y3
      t.string :turbine_coordinates_y4 
      t.string :turbine_coordinates_y5 
      t.string :turbine_avg_coordinates_x
      t.string :turbine_avg_coordinates_y 
      t.string :turbine_distance_mm_and_yy
      t.string :turbine_distance_nearest_town 
      t.string :turbine_rotor_dia 
      t.string :turbine_coordinates_wp1
      t.string :turbine_coordinates_wp2
      t.string :turbine_coordinates_wp3
      t.string :turbine_coordinates_wp4
      t.string :turbine_coordinates_wp5
      t.timestamps
    end
  end
end