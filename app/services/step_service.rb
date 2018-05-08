module StepService
  module_function

  def create(*args); StepService::Create.new(*args).call; end
  def create_report(*args); StepService::CreateReport.new(*args).call; end
end
