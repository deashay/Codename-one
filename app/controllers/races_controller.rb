class RacesController < ApplicationController
  expose(:race)

  before_filter :check_users_world_existance, only: :activate

  def create
    if race.save
      current_user.races << race
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def activate  
    current_user.races.where(:id.ne => race.id).update_all(active: false)
    race.update_attribute(:active, true)
    redirect_to root_path
  end

  protected

  def check_users_world_existance
    redirect_to root_path if current_user.world.present?
  end
end
