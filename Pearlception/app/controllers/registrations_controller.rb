class RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper
  #protected



  def create
    @user = User.new(sign_up_params)

    if params[:company_serial]
      params.require(:user).permit(:company_id)
      company = Company.find_by(company_token: params[:company_serial])

      if company
        @user.company_id = company.id
        if company.company_name == "IVA"
          @user.admin = true
        end
      else
      end

    else
    end
    @user.save
    sign_in @user
    redirect_to "/"
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
