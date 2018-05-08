module FeatureService
  class CreateReport < Services::Base
    def initialize(feature, user)
      @feature = feature
      @user = user
    end

    def perform
      report_feature = Report::Feature.new
      ActiveRecord::Base.transaction do
        report_feature.feature = @feature
        report_feature.user = @user
        report_feature.state = 'pending'
        report_feature.save!
        @feature.scenarios.each do |scenario|
          ::ScenarioService.create_report(report_feature, scenario, @user)
        end
      end
      report_feature
    end
  end
end
