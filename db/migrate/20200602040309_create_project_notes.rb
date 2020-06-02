class CreateProjectNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :project_notes do |t|
      t.integer :note_project_id, null: false
      t.text :description
      t.timestamps
    end
  end
end
