class RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper
  protected

  def create
    super
    binding.pry
  end

  def sign_up_params
    params.require(:user).permit(:company_id, :email, :password, :password_confirmation)
  end
end
