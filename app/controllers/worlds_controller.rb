class WorldsController < ApplicationController
  expose(:world, attributes: :permitted_params)

  def create
    world.generate_map

    if world.save
      redirect_to root_path, notice: 'Created new world'
    else
      render :new
    end
  end

  protected

  def permitted_params
    params.require(:world).permit(:name,:width,:height)
  end
end
