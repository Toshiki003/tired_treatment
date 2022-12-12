class TreatsController < ApplicationController
  def index
    @treats = Treat.all.order(created_at: :desc).page(params[:page])
  end

  def new
    @treat = Treat.new
  end

  def create
    @treat = Treat.new(treat_params)
    if @treat.save
      redirect_to @treat
    else
      render :new
    end
  end

  def show
    @treat = Treat.find(params[:id])
  end

  private

  def treat_params
    params.require(:treat).permit(:user, :event, :tired_level, :reward_category)
  end
end
