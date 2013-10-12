class WorldsController < ApplicationController
  expose(:world, attributes: :permitted_params)

  def create
    if world.save
      world.generate_map
      redirect_to root_path, notice: 'Created new world'
    else
      render :new
    end
  end

  def show
    render json: current_user.world.map_tiles
  end

  protected

  def permitted_params
    params.require(:world).permit(:name, :width, :height)
  end
end
