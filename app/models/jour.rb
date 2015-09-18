class Jour < ActiveRecord::Base
  has_many :paps, dependent: :destroy
  has_many :bars, through: :paps
  has_many :creneaus

  validates :date, length: { minimum: 5 }
  validates :max_affprev, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :max_commandos, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def bars_restants
    Bar.all.reject{ |bar| bars.include?(bar) }
  end
  def to_s
    date
  end
end
