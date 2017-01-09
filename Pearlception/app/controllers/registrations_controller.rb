class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:company_id, :email, :password, :password_confirmation)
  end
end