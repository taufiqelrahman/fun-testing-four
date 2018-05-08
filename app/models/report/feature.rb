class Report::Feature < ApplicationRecord
  acts_as_paranoid
  belongs_to :feature, class_name: '::Feature'
  belongs_to :user, class_name: '::User'
  has_many :report_scenarios, class_name: '::Report::Scenario', foreign_key: :report_feature_id

  state_machine :state, initial: :pending do
    event :success do
      transition [:pending, :failed] => :successed
    end
    event :decline do
      transition [:pending] => :failed
    end
  end

  def state
    self[:state]
  end
end
