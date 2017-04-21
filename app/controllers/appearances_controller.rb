class AppearancesController < ApplicationController
  # before_action :authorize_user

  def new
    @appearance = Appearance.new
  end

  def create
  @appearance = Appearance.new(appearance_params)
    byebug
    if @appearance.save
      redirect_to episode_path(appearance.episode)
    else
      redirect_to guests_path
    end
  end

  def show

  end

  def edit
    @appearance = Appearance.find(params[:id])
    redirect_to edit_appearance_path(@appearance)
  end

  def update
    @appearance = Apperance.find(params[:id])
    @appearance.update(appearance_params)
    redirect_to guests_path
  end


  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating)
  end

end
