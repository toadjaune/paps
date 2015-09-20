class Creneau < ActiveRecord::Base
  belongs_to :pap
  belongs_to :jour
  has_one :bar, through: :pap
  has_many :tentatives

  validates_presence_of :jour
  validates_presence_of :nom
  validates_presence_of :distance
  validates :genre, inclusion: { in: ['Affichage', 'Prevente', 'Commando'] }

  def commando?
    genre == 'Commando'
  end
  
  def affprev?
    not commando?
  end

  def to_s
    nom
  end
end
