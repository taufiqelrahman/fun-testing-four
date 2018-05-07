class Squad < ApplicationRecord
  has_many :features

  validates :name, uniqueness: true
end
