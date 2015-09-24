class Jour < ActiveRecord::Base
  has_many :paps, dependent: :destroy
  has_many :bars, through: :paps
  has_many :creneaus

  validates :date, length: { minimum: 5 }
  validates :max_affprev, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :max_commandos, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :actif, inclusion: { in: [true, false] }
  
  # Au plus un jour actif
  #before_save do |jour|
  #  Jour.where(actif: true).first.update(actif: false) if jour.actif?
  #end
  validate do |jour|
    jour_actif = Jour.where(actif: true).first
    if jour.actif? && !jour_actif.nil? && jour_actif.id != jour.id
      jour.errors[:base] << "Il doit y avoir au plus un jour courant"
    end
  end

  def self.actif
    Jour.where(actif: true).last
  end

  def bars_restants
    Bar.all.reject{ |bar| bars.include?(bar) }
  end

  def creneaus_affprev
    creneaus.where(genre: ['Affichage', 'Prevente'])
  end

  def creneaus_commando
    creneaus.where(genre: 'Commando')
  end

  def to_s
    date
  end
end
