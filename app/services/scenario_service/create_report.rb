module ScenarioService
  class CreateReport < Services::Base
    def initialize(report_feature, scenario, user)
      @report_feature = report_feature
      @scenario = scenario
      @user = user
    end

    def perform
      report_scenario = Report::Scenario.new
      ActiveRecord::Base.transaction do
        report_scenario.report_feature = @report_feature
        report_scenario.scenario = @scenario
        report_scenario.user = @user
        report_scenario.state = 'pending'
        report_scenario.save!
        @scenario.steps.each do |step|
          ::StepService.create_report(report_scenario, step, @user)
        end
      end
      report_scenario
    end
  end
end
