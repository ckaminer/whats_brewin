class Admin::StylesController < Admin::BaseController

  def new
    @style = Style.new
  end

  def create
    @style = Style.new(style_params)

    if @style.save
      redirect_to style_path(@style)
    else
      render :new
    end
  end


private

  def style_params
    params.require(:style).permit(:name)
  end

end
