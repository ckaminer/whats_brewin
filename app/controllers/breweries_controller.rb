class BreweriesController < ApplicationController

  def index
    @breweries = Brewery.all
  end

  def show
    @brewery = Brewery.find(params[:id])
  end

private

  def brewery_params
    params.require(:brewery).permit(:name, :location)
  end

end
