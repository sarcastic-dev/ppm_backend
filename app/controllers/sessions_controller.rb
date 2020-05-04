class SessionsController < Devise::SessionsController

  skip_before_action :authorize_request

  def create
    user = User.find_by(email: params[:email])
    if user && user.valid_password?(params[:password]) && sign_in(:user, user)
      token = JsonWebToken.encode(user_id: user.id)
      
      if user.update(session_id: token)
        render json: { data: { message: 'success', user_id: user.id, session_id: token,
           show_on_boarding: true } }, status: :ok
      end
    else
      render json: { errors: 'Invalid email and password' }, status: :bad_request
    end
  end


end
