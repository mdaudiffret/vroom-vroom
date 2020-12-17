class Driver < ApplicationRecord
  belongs_to :car
  has_many :linups
  has_many :race_positions
end
