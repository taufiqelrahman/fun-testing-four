module ReportService
  class UpdateReportFeature < Services::Base
    def initialize(report_feature, attributes = {})
      @report_feature = report_feature
      @attributes = attributes
    end

    def perform
      ActiveRecord::Base.transaction do
        @report_feature.assign_attributes(@attributes)
      end
      @report_feature
    end
  end
end
