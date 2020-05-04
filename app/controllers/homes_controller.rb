class HomesController < ApplicationController

  before_action :authorize_request

  def index
    render json: {name: current_user.name}, status: 200
  end

end