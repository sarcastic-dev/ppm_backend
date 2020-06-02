class SessionsController < Devise::SessionsController

  skip_before_action :authorize_request

  def create
    user = User.find_by(email: params[:email])
    if user && user.active?
      if user && user.valid_password?(params[:password]) && sign_in(:user, user)
        token = JsonWebToken.encode(user_id: user.id)
        if user.update(session_id: token)
          render json: { 
            user: {  
              id: user.id, 
              name: user.name,
              email: user.email,
              admin: user.admin,
              active: user.active,  
              session_id: token,
             }, message: 'Welcome! You have signed in successfully.' }, status: :ok
        end
      else
        render json: { message: 'Invalid email and password' }, status: :bad_request
      end
    else
      render json: { message: 'This user is not active or found' }, status: :bad_request
    end
  end


end
