class AppearancesController < ApplicationController

  def index
    @appearances = Appearance.all
  end

  def show
    @appearance = Appearance.find(params[:id])
  end

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
    # @appearance.user_id = current_user.id
    @appearance.save
      redirect_to @appearance.episode
    # else
      # redirect_to new_appearance_path
    # end
    # Wanted to make this work, but it's just not...
  end

  def edit
    @appearance = Appearance.find(params[:id])
  end

  def update
    @appearance = Appearance.find(params[:id])
    if @appearance.update(appearance_params)
      redirect_to episode_path(@appearance.episode)
    else
      render 'edit'
    end
  end




  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating, :user_id)
  end

end
