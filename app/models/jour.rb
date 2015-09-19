class Jour < ActiveRecord::Base
  has_many :paps, dependent: :destroy
  has_many :bars, through: :paps
  has_many :creneaus

  validates :date, length: { minimum: 5 }
  validates :max_affprev, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :max_commandos, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :actif, inclusion: { in: [true, false] }
  
  # Au plus un jour actif
  validate do |jour|
    if jour.actif? and (not (jour.id and Jour.find(jour.id).actif?)) and (Jour.where(actif: true).count >= 1)
      jour.errors[:base] << "Il doit y avoir au plus une année courante"
    end
  end

  def self.actif
    Jour.where(actif: true).last
  end

  def bars_restants
    Bar.all.reject{ |bar| bars.include?(bar) }
  end

  def to_s
    date
  end
end
