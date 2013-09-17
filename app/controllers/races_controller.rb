class RacesController < ApplicationController
  expose(:race)

  def create
    if race.save
      current_user.races << race
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end
end