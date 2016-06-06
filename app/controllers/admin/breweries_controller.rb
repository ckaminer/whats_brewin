class Admin::BreweriesController < Admin::BaseController

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

  def edit
    @brewery = Brewery.find(params[:id])
  end

  def update
    @brewery = Brewery.find(params[:id])
    if @brewery.update(brewery_params)
      redirect_to admin_brewery_path(@brewery)
    else
      render :edit
    end
  end

private

  def brewery_params
    params.require(:brewery).permit(:name, :location)
  end

end
