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
end
