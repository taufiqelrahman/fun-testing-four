module StepService
  module_function

  def create(*args); StepService::Create.new(*args).call; end
end
