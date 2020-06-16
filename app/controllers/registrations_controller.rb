class RegistrationsController < Devise::RegistrationsController

  skip_before_action :authorize_request

  def create

    user = User.find_by(email: params[:user][:email])
    if !user.present?
      user = User.new(user_params)
      if user.save
        render json: { user: user.as_json(only: [:id, :name, :email]), message: I18n.t('controllers.registrations.success')}, status: :created
      else
        render json: { message: resource.errors.full_messages.join(',').to_s }, status: :bad_request
      end
    else
      render json: { message: 'User already exists.' }, status: :bad_request
    end

  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end



end
