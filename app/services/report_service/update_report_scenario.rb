module ReportService
  class UpdateReportScenario < Services::Base
    def initialize(report_scenario, attributes = {})
      @report_scenario = report_scenario
      @attributes = attributes
    end

    def perform
      ActiveRecord::Base.transaction do
        @report_scenario.assign_attributes(@attributes)
      end
      @report_scenario
    end
  end
end
