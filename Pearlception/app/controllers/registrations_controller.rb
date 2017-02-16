class RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper
  #protected
  def new
      Apartment::Tenant.switch!
  end


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
    if !@user.admin
      Apartment::Tenant.switch(Company.find(@user.company_id).company_name.gsub(/'/,'').gsub(/\s/,''))
    end
    redirect_to "/"
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
