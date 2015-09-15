class Creneau < ActiveRecord::Base
  belongs_to :paps
  belongs_to :jour
  validates_presence_of :paps
  validates_presence_of :jour
  validates_presence_of :nom
  validates_presence_of :distance
end
