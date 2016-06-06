class Admin::BeersController < Admin::BaseController

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


private

  def beer_params
    params.require(:beer).permit(:name, :brewery_id, :style_id)
  end

end
