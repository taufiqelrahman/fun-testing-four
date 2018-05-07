class Squad < ApplicationRecord
  acts_as_paranoid
  has_many :features

  validates :name, uniqueness: true
end
