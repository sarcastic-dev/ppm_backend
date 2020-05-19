class CreateMetMastChkls < ActiveRecord::Migration[6.0]
  def change
    create_table :met_mast_chkls do |t|
      t.string :title
      t.timestamps
    end
  end
end
