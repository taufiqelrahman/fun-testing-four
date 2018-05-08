class Report::Step < ApplicationRecord
  acts_as_paranoid
  belongs_to :report_scenario, class_name: '::Report::Scenario'
  belongs_to :step, class_name: '::Step'
  belongs_to :user, class_name: '::User'

  validates :step_id, uniqueness: { scope: :report_scenario_id }
  state_machine :state, initial: :pending do
    event :success do
      transition [:pending, :failed] => :successed
    end
    event :decline do
      transition [:pending] => :failed
    end
  end

  before_save :set_to_successed
  after_commit :update_report_scenario

  def state
    self[:state]
  end

  private

  def set_to_successed
    self.state = :successed if self.state == 'pending'
  end

  def update_report_scenario
    if successed?
      other_report_steps = ::Report::Step.where(report_scenario_id: self.report_scenario_id).not(id: self.id).to_a
      all_success = other_report_steps.all?(&:successed?)
      ReportService.update_report_scenario(self.report_scenario, {state: 'successed'}) if all_success
    elsif failed?
      ReportService.update_report_scenario(self.report_scenario, {state: 'failed'})
    end
  end
end
