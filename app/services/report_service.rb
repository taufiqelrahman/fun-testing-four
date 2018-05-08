module ReportService
  module_function

  def update_report_feature(*args); ReportService::UpdateReportFeature.new(*args).call; end
  def update_report_scenario(*args); ReportService::UpdateReportScenario.new(*args).call; end
  def update_report_step(*args); ReportService::UpdateReportStep.new(*args).call; end
end
