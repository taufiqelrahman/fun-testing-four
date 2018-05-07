class Api::AuthenticationController < ApiController
  skip_before_action :authenticate_request

  def authenticate
    token = UserService.authenticate(params[:email], params[:password])

    if token
      render json: { auth_token: token }
    else
      render json: { error: 'invalid credentials' }, status: :unauthorized
    end
 end
end
