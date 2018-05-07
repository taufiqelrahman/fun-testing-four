class Step < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  has_and_belongs_to_many :scenarios

  validates :title, uniqueness: { scope: :available_on }
end
