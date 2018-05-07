module FeatureService
  module_function

  def create(*args); FeatureService::Create.new(*args).call; end
end
