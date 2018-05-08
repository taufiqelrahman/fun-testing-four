class Report::Scenario < ApplicationRecord
  acts_as_paranoid
  belongs_to :report_feature, class_name: '::Report::Feature'
  belongs_to :scenario, class_name: '::Scenario'
  belongs_to :user, class_name: '::User'
  has_many :report_steps, class_name: '::Report::Step', foreign_key: :report_scenario_id

  validates :scenario_id, uniqueness: { scope: :report_feature_id }
  state_machine :state, initial: :pending do
    event :success do
      transition [:pending, :failed] => :successed
    end
    event :decline do
      transition [:pending] => :failed
    end
  end
end
