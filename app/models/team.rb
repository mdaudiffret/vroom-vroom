class Team < ApplicationRecord
  belongs_to :user
  belongs_to :championship
  has_many :linups

  COLOR = ['rouge', 'bleu', 'blanc', 'vert', 'orange', 'jaune', 'noir', 'violet']
  LOGO = ['cheval', 'chapeau', 'reine', 'eclair', 'chevrons', 'pomme', 'dragon', 'colombe', 'hyppo', 'kiwi']
  validates :color, presence: true, inclusion: { in: COLOR }
  validates :logo, presence: true, inclusion: { in: LOGO }
end
