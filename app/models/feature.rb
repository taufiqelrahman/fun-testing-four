class Feature < ApplicationRecord
  belongs_to :squad_id
  has_and_belongs_to_many :scenarios
end
