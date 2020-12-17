class RacePosition < ApplicationRecord
  belongs_to :driver
  belongs_to :race
end
