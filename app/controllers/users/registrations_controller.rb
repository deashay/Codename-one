class Users::RegistrationsController < Devise::RegistrationsController
  expose_decorated(:user)
  
protected
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end