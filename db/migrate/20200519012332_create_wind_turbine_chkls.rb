class CreateWindTurbineChkls < ActiveRecord::Migration[6.0]
  def change
    create_table :wind_turbine_chkls do |t|
      t.string :title
      t.timestamps
    end
  end
end
