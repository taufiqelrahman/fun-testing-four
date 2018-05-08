module ScenarioService
  module_function

  def create(*args); ScenarioService::Create.new(*args).call; end
  def create_report(*args); ScenarioService::CreateReport.new(*args).call; end
end
