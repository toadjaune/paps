class Pap < ActiveRecord::Base
  belongs_to :jour
  belongs_to :bar
  has_many :creneaus
  has_many :tentatives

  validates_presence_of :jour
  validates_presence_of :bar
  validates_presence_of :question
  validates_presence_of :reponse

  def to_s
    "#{question} (#{bar})"
  end
end
