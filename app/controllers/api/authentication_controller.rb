class Api::AuthenticationController < ApiController
  skip_before_action :authenticate_request

  def authenticate
    token = UserService.authenticate(params[:email], params[:password])

    if token
      current_user = User.find_by(email: params[:email])
      current_user_hash = current_user.serializable_hash
      render json: { user: current_user_hash, authentication_token: token }
    else
      render json: { error: 'invalid credentials' }, status: :unauthorized
    end
  end
end
