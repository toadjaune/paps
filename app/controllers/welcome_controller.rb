class WelcomeController < ApplicationController

  skip_before_action :authenticate_user!
  skip_before_action :authenticate_admin!

  def index
  end

  def papshere
    @user = current_user
    @jour = Jour.actif
    @creneaux_affprev  = @jour.creneaus_affprev
    @creneaux_commando = @jour.creneaus_commando
  end

end
