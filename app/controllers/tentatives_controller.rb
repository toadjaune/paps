class TentativesController < ApplicationController

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
      redirect_to @tentative
    else
      render 'new'
    end
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
    params.require(:tentative).permit(:contenu, :pap_id, :user_id)
  end
end
