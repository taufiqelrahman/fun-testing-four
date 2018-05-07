module ScenarioService
  module_function

  def create(*args); ScenarioService::Create.new(*args).call; end
end
