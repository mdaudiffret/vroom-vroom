class Lineup < ApplicationRecord
  belongs_to :driver
  belongs_to :car
  belongs_to :team
  belongs_to :race
end
