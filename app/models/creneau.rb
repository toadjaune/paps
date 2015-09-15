class Creneau < ActiveRecord::Base
  belongs_to :pap
  belongs_to :jour
  validates_presence_of :pap
  validates_presence_of :jour
  validates_presence_of :nom
  validates_presence_of :distance
end
