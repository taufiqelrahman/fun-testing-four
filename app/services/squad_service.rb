module SquadService
  module_function

  def create(*args); SquadService::Create.new(*args).call; end
  def update(*args); SquadService::Update.new(*args).call; end
end
