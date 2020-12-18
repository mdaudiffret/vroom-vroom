class Race < ApplicationRecord
  belongs_to :circuit
  has_many :race_positions
  has_many :linups
end
