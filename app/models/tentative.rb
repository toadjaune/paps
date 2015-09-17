class Tentative < ActiveRecord::Base
  
  belongs_to :pap
  belongs_to :user

  validates_presence_of :pap
  validates_presence_of :user

  def to_s
    contenu
  end
end