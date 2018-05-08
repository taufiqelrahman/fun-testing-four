module StepService
  class CreateReport < Services::Base
    def initialize(report_scenario, step, user)
      @report_scenario = report_scenario
      @step = step
      @user = user
    end

    def perform
      report_step = Report::Step.new
      ActiveRecord::Base.transaction do
        report_step.report_scenario = @report_scenario
        report_step.step = @step
        report_step.user = @user
        report_step.state = 'pending'
        report_step.save!
      end
      report_step
    end
  end
end
