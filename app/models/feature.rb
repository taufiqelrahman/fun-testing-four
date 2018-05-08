class Feature < ApplicationRecord
  acts_as_paranoid
  belongs_to :squad
  has_and_belongs_to_many :scenarios
  has_many :reports, class_name: '::Report::Feature'

  validates :title, uniqueness: true

  def last_report
    reports.last
  end
end
