class Pap < ActiveRecord::Base
  belongs_to :jour
  belongs_to :bar
  has_many :creneaus
  has_many :tentatives

  validates_presence_of :jour
  validates_presence_of :bar
  validates_presence_of :question
  validates_presence_of :reponse

  before_validation :simplify 
  
  def simplify
    reponse.downcase!
  end

  def can_paps_affprev?
    creneaus.where(genre: ['Affichage', 'Prevente']).count < jour.max_affprev
  end

  def can_paps_commando?
    creneaus.where(genre: 'Commando').count < jour.max_commandos
  end

  def to_s
    "#{question} (#{bar})"
  end
end
