class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authorize_request
  before_action :set_paper_trail_whodunnit

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  protected

    def authorize_request
      header = request.headers['session-id']
      header = header.split(' ').last if header
      if !header.present?
        render json: { errors: 'Unauthorized user' }, status: :unauthorized
      else
        if User.find_by(session_id: header, active: true)
          begin
            @decoded = JsonWebToken.decode(header)
            @current_user = User.find(@decoded[:user_id])
          rescue ActiveRecord::RecordNotFound => e
            render json: { message: e.message }, status: :unauthorized
          rescue JWT::DecodeError => e
            render json: { message: e.message }, status: :unauthorized
          rescue JWT::VerificationError => e
            render json: { message: e.message }, status: :unauthorized
          end
        else
          render json: { message: 'Unauthorized user' }, status: :unauthorized
        end
      end
    end
end
