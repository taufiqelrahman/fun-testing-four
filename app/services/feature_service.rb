module FeatureService
  module_function

  def create(*args); FeatureService::Create.new(*args).call; end
  def update(*args); FeatureService::Update.new(*args).call; end
  def create_report(*args); FeatureService::CreateReport.new(*args).call; end
end
