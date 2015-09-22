class JoursController < ApplicationController

  def index
    @jours = Jour.all
  end

  def edit
    @jour = Jour.find(params[:id])
  end
  
  def show
    @jour = Jour.find(params[:id])
    @bars_restants = @jour.bars_restants
  end

  def new
    @jour = Jour.new
  end

  def create
    @jour = Jour.new(jour_params)
    if @jour.save 
      redirect_to @jour
    else
      render 'new'
    end
  end

  def update
    @jour = Jour.find(params[:id])
    if @jour.update(jour_params)
      redirect_to @jour
    else
      render 'edit'
    end
  end

  def destroy
    @jour = Jour.find(params[:id])
    @jour.destroy
    redirect_to jours_path
  end

  def newpaps
    @jour = Jour.find(params[:id])
    @bars_restants = @jour.bars_restants
    @pap = Pap.new
  end

  def newcreneau
    @jour = Jour.find(params[:id])
    @creneau = Creneau.new
  end

  def showtentatives
    @jour = Jour.find(params[:id])
    @tentatives = []
    @jour.paps.each { |p| p.tentatives.each { |t| @tentatives << t } }
    @tentatives.sort! { |e| e[:id] }
  end


  private
    def jour_params
      params.require(:jour).permit(:date, :max_commandos, :max_affprev, :actif)
    end

end
