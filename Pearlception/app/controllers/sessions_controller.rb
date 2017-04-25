class SessionsController < Devise::RegistrationsController
  include ApplicationHelper

  def new
    super
  end

  def create
    params = sign_in_params
    @user = User.find_by(email: params[:email])
    if @user == nil || !@user.valid_password?(params[:password])
      redirect_to "/signin"
      return
    end
    #Do we need this code below? It was never running before
    #resource = warden.authenticate!(:scope => :user)
    sign_in(@user)
    if !current_user.admin
      Apartment::Tenant.switch!(Company.find(current_user.company_id).company_name.gsub(/'/,'').gsub(/\s/,''))
    end
    redirect_to "/pearlception"
  end

private
  
  def sign_in_params
    params.require(:user).permit(:email,:password,:remember_me)
  end

end
