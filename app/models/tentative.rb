class Tentative < ActiveRecord::Base
  
  belongs_to :pap
  belongs_to :user
  belongs_to :creneau

  validates_presence_of :pap
  validates_presence_of :user
  validates_presence_of :contenu
  validates_presence_of :creneau

  before_validation :simplify

  def to_s
    contenu
  end

  def correct?
    pap.reponse.split(';').each do |rep|
      if contenu == rep
        return true
      end
    end
    false
  end

  protected

    def simplify
      contenu.downcase!
    end

end
