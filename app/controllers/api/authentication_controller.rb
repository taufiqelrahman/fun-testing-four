class Api::AuthenticationController < ApiController
  skip_before_action :authenticate_request

  def authenticate
    token = UserService.authenticate(params[:email], params[:password])

    if token
      current_user = User.find_by(email: params[:email])
      render json: { user: current_user.serializable_hash, authentication_token: token }
    else
      render json: { error: 'invalid credentials' }, status: :unauthorized
    end
 end
end
