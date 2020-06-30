module Api
  class UsersController < ApplicationController
    
    skip_before_action :authorize_request, only: [:check_session]

    def index
      users = User.all
      if users
        render json: { message: 'success', data: users.as_json(only: [:id, :name, :email, :active])}, status: 200
      else
        render json: { message: 'No project listed, Add a project.' }, status: 400
      end
    end

    def active
      user = User.find_by(id: params[:id])
      if user && user.update(active: params[:active])
        render json: { message: 'success', data: user.as_json(only: [:id, :name, :active])}, status: 200
      else
        render json: { message: 'Something went wrong!' }, status: 400
      end
    end

    def check_session
      user = User.find_by(session_id: request.headers['session-id'])
      if user.present?
        render json: { message: 'success', data: user.as_json(only: [:id, :name, :active])}, status: 200
      else
        render json: { message: 'Something went wrong!' }, status: 400
      end
    end

  end
end