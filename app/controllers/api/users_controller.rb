class Api::UsersController < ApiController
  skip_before_action :authenticate_request, only: [:create]

  def index
    users = User.all
    json_response(users)
  end

  def show
    json_response(current_user)
  end

  def create
    @user = User.create!(user_params)
    json_response(@todo, :created)
  end

   def update
    current_user.update(user_params)
    head :no_content
  end

  def destroy
    current_user.destroy
    head :no_content
  end

  private

  def user_params
    user_params = params[:user].permit :username, :email, :password
  end

  def set_user
    @user = User.find(params[:id])
  end

end
