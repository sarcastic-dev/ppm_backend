class CreateProjectCheckedLists < ActiveRecord::Migration[6.0]
  def change
    create_table :project_checked_lists do |t|
      t.integer :project_id
      t.string :title_checklist
      t.text :checklist_items
      t.timestamps
    end
  end
end