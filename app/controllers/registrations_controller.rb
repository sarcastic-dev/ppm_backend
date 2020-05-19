class RegistrationsController < Devise::RegistrationsController

  skip_before_action :authorize_request

  def create
    build_resource(sign_up_params)
    
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        sign_up(:user, resource)
        render json: { user: resource.as_json(only: [:id, :name, :email]), message: I18n.t('controllers.registrations.success')}, status: :created
      else
        expire_data_after_sign_in!
        render json: { user: resource.as_json(only: [:id, :name, :email]), message: I18n.t('controllers.registrations.inactive') }, status: :forbidden
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      render json: { message: resource.errors.full_messages.join(',').to_s }, status: :bad_request
    end
  end

end
