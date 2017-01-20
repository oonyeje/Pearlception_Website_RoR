class RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper
  #protected

  def create
    binding.pry
    @user = User.new(sign_up_params)
    if !@user.admin?
      #search by company token given by one of pearlception admins to the company
      #and look up comany_id #
      @user.company_id = 0
    else
      @user.company_id = -1
    end
    @user.save
    sign_in @user
    redirect_to "/"
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :company_id)
  end
end
