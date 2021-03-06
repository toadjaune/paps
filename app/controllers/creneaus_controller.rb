class CreneausController < ApplicationController

  def index
    @creneaus = Creneau.all
  end

  def edit
    @creneau = Creneau.find(params[:id])
  end

  def show
    @creneau = Creneau.find(params[:id])
  end

  def new
    @creneau = Creneau.new
  end

  def create
    @creneau = Creneau.new(creneau_params)
    if @creneau.save 
      redirect_to @creneau.jour
    else
      render 'new'
    end
  end

  def update
    @creneau = Creneau.find(params[:id])
    if @creneau.update(creneau_params)
      redirect_to @creneau.jour
    else
      render 'edit'
    end
  end

  def to_s
    nom
  end

  def destroy
    @creneau = Creneau.find(params[:id])
    @creneau.destroy
    redirect_to @creneau.jour
  end

  private
  def creneau_params
    params.require(:creneau).permit(:nom, :distance, :adresse, :commentaires, :pap_id, :jour_id, :genre)
  end
end
