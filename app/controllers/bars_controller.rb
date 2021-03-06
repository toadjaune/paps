class BarsController < ApplicationController

  def index
    @bars = Bar.all
  end

  def edit
    @bar = Bar.find(params[:id])
  end
  
  def show
    @bar = Bar.find(params[:id])
  end

  def new
  end

  def create
    @bar = Bar.new(bar_params)
    if @bar.save 
      redirect_to bars_path
    else
      render 'new'
    end
  end

  def update
    @bar = Bar.find(params[:id])
    if @bar.update(bar_params)
      redirect_to @bar
    else
      render 'edit'
    end
  end

  def to_s
    name
  end

  def destroy
    @bar = Bar.find(params[:id])
    @bar.destroy
    redirect_to bars_path
  end

  private
    def bar_params
      params.require(:bar).permit(:name)
    end

end
