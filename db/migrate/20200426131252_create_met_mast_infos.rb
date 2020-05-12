class CreateMetMastInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :met_mast_infos do |t|
      t.integer :mast_project_id 
      t.string :mast_name 
      t.string :mast_Type
      t.string :mast_height
      t.string :mast_dimension_type1_x 
      t.string :mast_dimension_type2_x
      t.string :mast_dimension_type3_x 
      t.string :mast_dimension_type1_y 
      t.string :mast_dimension_type2_y
      t.string :mast_dimension_type3_y 
      t.string :mast_dimension_type1_value 
      t.string :mast_dimension_type2_value
      t.string :mast_dimension_type3_value 
      t.string :mast_no_of_segment_type1 
      t.string :mast_no_of_segment_type2
      t.string :mast_no_of_segment_type3 
      t.string :mast_length_of_segment_type1 
      t.string :mast_length_of_segment_type2
      t.string :mast_length_of_segment_type3 
      t.string :mast_total_length 
      t.string :mast_primary_mounting
      t.string :mast_coordinates_x1 
      t.string :mast_coordinates_x2 
      t.string :mast_coordinates_x3
      t.string :mast_coordinates_x4 
      t.string :mast_coordinates_x5 
      t.string :mast_coordinates_y1
      t.string :mast_coordinates_y2 
      t.string :mast_coordinates_y3 
      t.string :mast_coordinates_y4
      t.string :mast_coordinates_y5 
      t.string :mast_avg_coordinates_x 
      t.string :mast_avg_coordinates_y
      t.timestamps
    end
  end
end




