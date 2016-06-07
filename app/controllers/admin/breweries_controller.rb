class Admin::BreweriesController < Admin::BaseController

  before_action :set_brewery, only: [:show, :edit, :update, :destroy]

  def index
    @breweries = Brewery.all
  end

  def new
    @brewery = Brewery.new
  end

  def create
    @brewery = Brewery.new(brewery_params)

    if @brewery.save
      redirect_to brewery_path(@brewery)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @brewery.update(brewery_params)
      redirect_to admin_brewery_path(@brewery)
    else
      render :edit
    end
  end

  def destroy
    @brewery.destroy
    redirect_to admin_breweries_path
  end

private

  def set_brewery
    @brewery = Brewery.find(params[:id])
  end

  def brewery_params
    params.require(:brewery).permit(:name, :location)
  end

end
