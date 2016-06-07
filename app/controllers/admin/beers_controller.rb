class Admin::BeersController < Admin::BaseController

  before_action :set_beer, only: [:show, :edit, :update, :destroy]

  def index
    @beers = Beer.all
  end

  def new
    @beer = Beer.new
    @breweries = Brewery.all
    @styles = Style.all
  end

  def create
    @beer = Beer.new(beer_params)
    @breweries = Brewery.all
    @styles = Style.all

    if @beer.save
      redirect_to beer_path(@beer)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @breweries = Brewery.all
    @styles = Style.all
  end

  def update
    if @beer.update(beer_params)
      redirect_to admin_beer_path(@beer)
    else
      render :edit
    end
  end

  def destroy
    @beer.destroy
    redirect_to admin_beers_path
  end

private

  def set_beer
    @beer = Beer.find(params[:id])
  end

  def beer_params
    params.require(:beer).permit(:name, :brewery_id, :style_id)
  end

end
