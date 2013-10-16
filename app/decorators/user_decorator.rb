class UserDecorator < Draper::Decorator
  delegate_all

  def world
    object.world || 'You are not connected to any world'
  end

  def connected_to_any_world?
    object.world.present?
  end

end
