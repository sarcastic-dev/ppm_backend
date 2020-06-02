module Api
  class ProjectNotesController < ApplicationController

    def create
      project_note = ProjectNote.find_by(note_project_id: params[:id])
      if !project_note && ProjectNote.create(project_note_params)
        render json: { message: 'Stored' },  status: :ok
      else
        render json: { message: 'something went wrong' },  status: 400
      end
    end

    def show
      project_note = ProjectNote.find_by(note_project_id: params[:id])
      if project_note
        render json: { message: 'success', data: project_note.as_json(except: [:created_at, :updated_at]) }, status: 200
      else
        render json: { message: 'No project listed, Add a project.' }, status: 400
      end
    end

    def update
      project_note = ProjectNote.find_by(note_project_id: params[:id])
      if project_note.update(project_note_params)
        render json: { message: 'Updated successfully', data: project_note.as_json(except: [:created_at, :updated_at])}, status: :ok
      else
        render json: { message: 'something went wrong' }, status: 400
      end
    end

    def project_note_params
      params.permit(
       :note_project_id,
       :description
      )
    end

  end
end