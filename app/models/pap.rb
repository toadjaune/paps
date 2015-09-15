class Pap < ActiveRecord::Base
  belongs_to :jour
  belongs_to :bar
  has_many :creneaus

  validates_presence_of :jour
  validates_presence_of :bar
  validates_presence_of :question
  validates_presence_of :reponse
end
