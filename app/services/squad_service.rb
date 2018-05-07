module SquadService
  module_function

  def create(*args); SquadService::Create.new(*args).call; end
end
