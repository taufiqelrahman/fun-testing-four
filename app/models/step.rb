class Step < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  has_and_belongs_to_many :scenarios
  has_many :reports, class_name: '::Report::Step'

  validates :title, uniqueness: { scope: :available_on }

  def last_report
    reports.last
  end
end
