class N1asController < ApplicationController

  def index
    @n1as = N1a.all
  end

  def show
    @n1a = N1a.find(params[:id])
  end

  def new
  end

  def create
    @n1a = N1a.new(n1a_params)
    if @n1a.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  private
    def n1a_params
      params.require(:n1a).permit(:name, :bar_id)
    end
end
