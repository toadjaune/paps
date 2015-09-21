class WelcomeController < ApplicationController

  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_admin!

  def index
  end

  def papshere
    @user = current_user
    @jour = Jour.actif
    @bar = current_user.bar
    @tentative = Tentative.new
    if @jour
      @creneaux_affprev  = @jour.creneaus_affprev
      @creneaux_commando = @jour.creneaus_commando
      @paps = @jour.paps.where(bar_id: @bar.id).take
    end
  end

  def barcreneaux
    @bar = current_user.bar
  end

end
