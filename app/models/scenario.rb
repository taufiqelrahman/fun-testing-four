class Scenario < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  has_and_belongs_to_many :steps
  has_and_belongs_to_many :features
  has_many :reports, class_name: '::Report::Scenario'

  def last_report
    reports.last
  end
end
