class Admin::StylesController < Admin::BaseController

  before_action :set_style, only: [:show, :edit, :update, :destroy]

  def index
    @styles = Style.all
  end

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

  def show
  end

  def edit
  end

  def update
    if @style.update(style_params)
      redirect_to admin_style_path(@style)
    else
      render :edit
    end
  end

  def destroy
    @style.destroy
    redirect_to admin_styles_path
  end

private

  def set_style
    @style = Style.find(params[:id])
  end

  def style_params
    params.require(:style).permit(:name)
  end

end
