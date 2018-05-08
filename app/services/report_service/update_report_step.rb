module ReportService
  class UpdateReportStep < Services::Base
    def initialize(report_step, attributes = {})
      @report_step = report_step
      @attributes = attributes
    end

    def perform
      ActiveRecord::Base.transaction do
        @report_step.assign_attributes(@attributes)
        @report_step.save!
      end
      @report_step
    end
  end
end
