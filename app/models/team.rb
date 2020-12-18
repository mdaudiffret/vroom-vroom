class Team < ApplicationRecord
  belongs_to :user
  belongs_to :championship
  has_many :linups
end
