class BreweriesController < ApplicationController

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
    @brewery = Brewery.find(params[:id])
  end

private

  def brewery_params
    params.require(:brewery).permit(:name, :location)
  end

end
