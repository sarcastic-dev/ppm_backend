class CreateBoomSensorInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :boom_sensor_infos do |t|
      t.integer :boom_project_id
      t.string :boom_top_anemometer_hoz_x
      t.string :boom_top_anemometer_hoz_y
      t.string :boom_top_anemometer_ver_x
      t.string :boom_top_anemometer_ver_y
      t.string :boom_top_anemometer_height
      t.string :boom_mid_anemometer_hoz_x
      t.string :boom_mid_anemometer_hoz_y
      t.string :boom_mid_anemometer_ver_x
      t.string :boom_mid_anemometer_ver_y
      t.string :boom_mid_anemometer_height
      t.string :boom_shear_anemometer_hoz_x
      t.string :boom_shear_anemometer_hoz_y
      t.string :boom_shear_anemometer_ver_x
      t.string :boom_shear_anemometer_ver_y
      t.string :boom_shear_anemometer_height
      t.string :boom_propeller_anemometer_hoz_x
      t.string :boom_propeller_anemometer_hoz_y
      t.string :boom_propeller_anemometer_ver_x
      t.string :boom_propeller_anemometer_ver_y
      t.string :boom_propeller_anemometer_height
      t.string :boom_primary_wind_vane_hoz_x
      t.string :boom_primary_wind_vane_hoz_y
      t.string :boom_primary_wind_vane_ver_x
      t.string :boom_primary_wind_vane_ver_y
      t.string :boom_primary_wind_vane_height
      t.string :boom_control_wind_vane_hoz_x
      t.string :boom_control_wind_vane_hoz_y
      t.string :boom_control_wind_vane_ver_x
      t.string :boom_control_wind_vane_ver_y
      t.string :boom_control_wind_vane_height
      t.string :boom_pressure_sensor_height
      t.string :boom_temperature_sensor_height
      t.string :boom_logger_box_height
      t.text :boom_panorama_picture_north
      t.text :boom_panorama_picture_north_west
      t.text :boom_panorama_picture_west
      t.text :boom_panorama_picture_south_west
      t.text :boom_panorama_picture_south
      t.text :boom_panorama_picture_south_east
      t.text :boom_panorama_picture_east
      t.text :boom_panorama_picture_north_east
      t.timestamps
    end
  end
end