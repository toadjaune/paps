class PapsController < ApplicationController

  def index
    @paps = Pap.all
  end

  def edit
    @pap = Pap.find(params[:id])
  end
  
  def show
    @pap = Pap.find(params[:id])
  end

  def new
  end

  def create
    @pap = Pap.new(pap_params)
    if @pap.save 
      redirect_to @pap
    else
      render 'new'
    end
  end

  def update
    @pap = Pap.find(params[:id])
    if @pap.update(pap_params)
      redirect_to @pap
    else
      render 'edit'
    end
  end

  def destroy
    @pap = Pap.find(params[:id])
    @pap.destroy
    redirect_to paps_path
  end

  private
    def pap_params
      params.require(:pap).permit(:question, :reponse, :jour_id, :bar_id)
    end

end
