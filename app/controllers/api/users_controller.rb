class Api::UsersController < ApiController
  skip_before_action :authenticate_request, only: [:create]

  def me
    json_response(current_user)
  end

  def index
    users = User.all
    json_response(users)
  rescue => e
    render json: {error: e.message}, status: 422
  end

  def show
    user = User.find(params[:id])
    json_response(user)
  rescue => e
    render json: {error: e.message}, status: 422
  end

  def create
    @user = User.create!(user_params)
    json_response(@user, status: :created)
  rescue => e
    render json: {error: e.message}, status: 422
  end

  def update
    current_user.update(user_params)
    json_response(current_user, status: :updated)
  rescue => e
    render json: {error: e.message}, status: 422
  end

  private

  def user_params
    params.permit :username, :email, :password
  end

end
