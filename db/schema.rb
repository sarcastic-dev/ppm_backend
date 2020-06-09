# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_07_171808) do

  create_table "boom_sensor_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "boom_project_id"
    t.string "boom_top_anemometer_hoz_x"
    t.string "boom_top_anemometer_hoz_y"
    t.string "boom_top_anemometer_ver_x"
    t.string "boom_top_anemometer_ver_y"
    t.string "boom_top_anemometer_height"
    t.string "boom_mid_anemometer_hoz_x"
    t.string "boom_mid_anemometer_hoz_y"
    t.string "boom_mid_anemometer_ver_x"
    t.string "boom_mid_anemometer_ver_y"
    t.string "boom_mid_anemometer_height"
    t.string "boom_shear_anemometer_hoz_x"
    t.string "boom_shear_anemometer_hoz_y"
    t.string "boom_shear_anemometer_ver_x"
    t.string "boom_shear_anemometer_ver_y"
    t.string "boom_shear_anemometer_height"
    t.string "boom_propeller_anemometer_hoz_x"
    t.string "boom_propeller_anemometer_hoz_y"
    t.string "boom_propeller_anemometer_ver_x"
    t.string "boom_propeller_anemometer_ver_y"
    t.string "boom_propeller_anemometer_height"
    t.string "boom_primary_wind_vane_hoz_x"
    t.string "boom_primary_wind_vane_hoz_y"
    t.string "boom_primary_wind_vane_ver_x"
    t.string "boom_primary_wind_vane_ver_y"
    t.string "boom_primary_wind_vane_height"
    t.string "boom_control_wind_vane_hoz_x"
    t.string "boom_control_wind_vane_hoz_y"
    t.string "boom_control_wind_vane_ver_x"
    t.string "boom_control_wind_vane_ver_y"
    t.string "boom_control_wind_vane_height"
    t.string "boom_pressure_sensor_height"
    t.string "boom_temperature_sensor_height"
    t.string "boom_logger_box_height"
    t.text "boom_panorama_picture_north"
    t.text "boom_panorama_picture_north_west"
    t.text "boom_panorama_picture_west"
    t.text "boom_panorama_picture_south_west"
    t.text "boom_panorama_picture_south"
    t.text "boom_panorama_picture_south_east"
    t.text "boom_panorama_picture_east"
    t.text "boom_panorama_picture_north_east"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "met_mast_chkls", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "met_mast_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "mast_project_id"
    t.string "mast_name"
    t.string "mast_Type"
    t.string "mast_height"
    t.string "mast_dimension_type1_x"
    t.string "mast_dimension_type2_x"
    t.string "mast_dimension_type3_x"
    t.string "mast_dimension_type1_y"
    t.string "mast_dimension_type2_y"
    t.string "mast_dimension_type3_y"
    t.string "mast_dimension_type1_value"
    t.string "mast_dimension_type2_value"
    t.string "mast_dimension_type3_value"
    t.string "mast_no_of_segment_type1"
    t.string "mast_no_of_segment_type2"
    t.string "mast_no_of_segment_type3"
    t.string "mast_length_of_segment_type1"
    t.string "mast_length_of_segment_type2"
    t.string "mast_length_of_segment_type3"
    t.string "mast_total_length"
    t.string "mast_primary_mounting"
    t.string "mast_coordinates_x1"
    t.string "mast_coordinates_x2"
    t.string "mast_coordinates_x3"
    t.string "mast_coordinates_x4"
    t.string "mast_coordinates_x5"
    t.string "mast_coordinates_y1"
    t.string "mast_coordinates_y2"
    t.string "mast_coordinates_y3"
    t.string "mast_coordinates_y4"
    t.string "mast_coordinates_y5"
    t.string "mast_avg_coordinates_x"
    t.string "mast_avg_coordinates_y"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_checked_lists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "project_id"
    t.string "title_checklist"
    t.text "checklist_items"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "project_user_id"
    t.string "project_job_no"
    t.string "project_date"
    t.string "project_eng"
    t.string "project_support_eng"
    t.string "project_customer"
    t.string "project_site_name"
    t.string "project_rated_capacity"
    t.string "project_hub_height"
    t.string "project_rotor_dia"
    t.string "project_customer_contact"
    t.string "project_mobile_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_notes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "note_project_id", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "turbine_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "turbine_project_id"
    t.string "turbine_id"
    t.string "turbine_date"
    t.string "turbine_make"
    t.string "turbine_type"
    t.string "turbine_name_nearest_town"
    t.string "turbine_habitation"
    t.string "turbine_vegetation"
    t.string "turbine_hub_height"
    t.string "turbine_coordinates_x1"
    t.string "turbine_coordinates_x2"
    t.string "turbine_coordinates_x3"
    t.string "turbine_coordinates_x4"
    t.string "turbine_coordinates_x5"
    t.string "turbine_coordinates_y1"
    t.string "turbine_coordinates_y2"
    t.string "turbine_coordinates_y3"
    t.string "turbine_coordinates_y4"
    t.string "turbine_coordinates_y5"
    t.string "turbine_avg_coordinates_x"
    t.string "turbine_avg_coordinates_y"
    t.string "turbine_distance_mm_and_yy"
    t.string "turbine_distance_nearest_town"
    t.string "turbine_rotor_dia"
    t.string "turbine_coordinates_wp1"
    t.string "turbine_coordinates_wp2"
    t.string "turbine_coordinates_wp3"
    t.string "turbine_coordinates_wp4"
    t.string "turbine_coordinates_wp5"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "unique_id", default: "", null: false
    t.string "email", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false, null: false
    t.boolean "active", default: false, null: false
    t.string "session_id", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "item_type", limit: 191, null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", size: :long
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "wind_turbine_chkls", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
