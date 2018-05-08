class Report::Scenario < ApplicationRecord
  acts_as_paranoid
  belongs_to :report_feature, class_name: '::Report::Feature'
  belongs_to :scenario, class_name: '::Scenario'
  belongs_to :user, class_name: '::User'
  has_many :report_steps, class_name: '::Report::Step', foreign_key: :report_scenario_id

  validates :scenario_id, uniqueness: { scope: :report_feature_id }
  state_machine :state, initial: :pending do
    event :pass do
      transition [:pending, :failed, :blocked] => :passed
    end
    event :blocking do
      transition [:pending] => :blocked
    end
    event :decline do
      transition [:pending, :blocked] => :failed
    end
  end

  after_commit :update_report_feature

  private

  def update_report_feature
    if passed?
      other_report_scenarios = ::Report::Scenario.where(report_feature_id: self.report_feature_id).where.not(id: self.id).to_a
      all_success = other_report_scenarios.all?(&:successed?)
      ReportService.update_report_feature(self.report_feature, {state: 'passed'}) if all_success
    elsif failed?
      ReportService.update_report_feature(self.report_feature, {state: 'failed'})
    end
  end
end
