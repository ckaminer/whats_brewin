class BeersController < ApplicationController

  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find(params[:id])
    @rating = Rating.new
  end


private

  def beer_params
    params.require(:beer).permit(:name, :brewery, :style)
  end

end
