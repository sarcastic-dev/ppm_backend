class CreateProjectInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :project_infos do |t|
      t.string :project_user_id
      t.string :project_unique_id
      t.string :project_job_no
      t.string :project_date
      t.string :project_eng
      t.string :project_support_eng
      t.string :project_customer
      t.string :project_site_name
      t.string :project_rated_capacity
      t.string :project_hub_height
      t.string :project_rotor_dia
      t.string :project_customer_contact
      t.string :project_mobile_no
      t.timestamps
    end
  end
end
