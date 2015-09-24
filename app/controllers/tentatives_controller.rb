class TentativesController < ApplicationController

  skip_before_action :authenticate_admin!, only: :create
  def index
    @tentatives = Tentative.all
  end

  def edit
    @tentative = Tentative.find(params[:id])
  end

  def show
    @tentative = Tentative.find(params[:id])
  end

  def new
    @tentative = Tentative.new
  end

  def create
    @tentative = Tentative.new(tentative_params)
    if @tentative.save 
      try_to_paps
    end
    redirect_to :back
  end

  def update
    @tentative = Tentative.find(params[:id])
    if @tentative.update(tentative_params)
      redirect_to @tentative
    else
      render 'edit'
    end
  end

  def to_s
    contenu
  end

  def destroy
    @tentative = Tentative.find(params[:id])
    @tentative.destroy
    redirect_to tentatives_path
  end

  private

  def tentative_params
    params.require(:tentative).permit(:contenu, :pap_id, :user_id, :creneau_id)
  end

  def try_to_paps
    Creneau.transaction do
      if @tentative.creneau.affprev?
        if @tentative.creneau.pap.nil?
          if @tentative.pap.can_paps_affprev?
            if @tentative.correct?
              @tentative.creneau.pap = @tentative.pap
              @tentative.creneau.save!
              flash.notice = "Bravo ! Vous avez PAPSé ce créneau !"
            else
              flash.alert = "Réponse incorrecte"
            end
          else
            flash.alert = "Vous avez déjà PAPSé le maximum de créneaux affprev pour aujourd'hui"
          end
        else
          flash.alert = "Ce créneau a déjà été PAPSé"
        end
      end
      if @tentative.creneau.commando?
        if @tentative.creneau.pap.nil?
          if @tentative.pap.can_paps_commando?
            if @tentative.correct?
              @tentative.creneau.pap = @tentative.pap
              @tentative.creneau.save!
              flash.notice = "Bravo ! Vous avez PAPSé ce créneau !"
            else
              flash.alert = "Réponse incorrecte"
            end
          else
            flash.alert = "Vous avez déjà PAPSé le maximum de créneaux commando pour aujourd'hui"
          end
        else
          flash.alert = "Ce créneau a déjà été PAPSé"
        end
      end
    end
  end
end
