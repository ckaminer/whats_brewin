class StylesController < ApplicationController

  def index
    @styles = Style.all
  end

  def show
    @style = Style.find(params[:id])
  end


private

  def style_params
    params.require(:style).permit(:name)
  end

end
