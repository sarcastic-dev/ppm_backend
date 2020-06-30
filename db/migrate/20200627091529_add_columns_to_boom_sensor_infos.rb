class AddColumnsToBoomSensorInfos < ActiveRecord::Migration[6.0]
  def change
    add_column :boom_sensor_infos, :boom_panorama_picture_north_lat, :string
    add_column :boom_sensor_infos, :boom_panorama_picture_north_long, :string
    add_column :boom_sensor_infos, :boom_panorama_picture_north_west_lat, :string
    add_column :boom_sensor_infos, :boom_panorama_picture_north_west_long, :string
    add_column :boom_sensor_infos, :boom_panorama_picture_west_lat, :string
    add_column :boom_sensor_infos, :boom_panorama_picture_west_long, :string
    add_column :boom_sensor_infos, :boom_panorama_picture_south_west_lat, :string
    add_column :boom_sensor_infos, :boom_panorama_picture_south_west_long, :string
    add_column :boom_sensor_infos, :boom_panorama_picture_south_lat, :string
    add_column :boom_sensor_infos, :boom_panorama_picture_south_long, :string
    add_column :boom_sensor_infos, :boom_panorama_picture_south_east_lat, :string
    add_column :boom_sensor_infos, :boom_panorama_picture_south_east_long, :string
    add_column :boom_sensor_infos, :boom_panorama_picture_east_lat, :string
    add_column :boom_sensor_infos, :boom_panorama_picture_east_long, :string
    add_column :boom_sensor_infos, :boom_panorama_picture_north_east_lat, :string
    add_column :boom_sensor_infos, :boom_panorama_picture_north_east_long, :string
  end
end