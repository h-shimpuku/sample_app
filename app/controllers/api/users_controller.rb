class Api::UsersController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def index
    users = User.where(activated: true)
    render json: users
  end
end
