module UserService
  module_function

  def authenticate(*args); UserService::Authenticate.new(*args).call; end
end
