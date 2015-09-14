class Jour < ActiveRecord::Base
  validates :date, length: { minimum: 5 }
  validates :max_affprev, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :max_commandos, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def to_s
    date
  end
end
