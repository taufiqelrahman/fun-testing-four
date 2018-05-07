class Feature < ApplicationRecord
  acts_as_paranoid
  belongs_to :squad
  has_and_belongs_to_many :scenarios

  validates :title, uniqueness: true
end
