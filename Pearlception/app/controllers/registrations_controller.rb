class RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper
  #protected
  def new
      Apartment::Tenant.switch!
  end

  #Method to create a new User
  def create
    user_params = sign_up_params
    @user = User.new(user_params)
    #if either the password or password confirmation is missing, redirect to sign in again
    puts params
    if user_params[:password] == nil || user_params[:password_confirmation] == nil
        flash[:error] = "Need a password to sign up"
        redirect_to '/signin' and return 
    end
    if params[:company_serial]
      company = Company.find_by(company_token: params[:company_serial])
      if company
        @user.company_id = company.id
        if company.company_name == "IVA"
          @user.admin = true
        end
      else
        flash[:alert] = "The serial key provided was invalid."
        redirect_to '/'
      end
    else
      flash[:alert] = "A company serial key must be provided to register."
      redirect_to '/'
    end
  
    if @user == ""
      flash[:alert] = "Please provide a password to register with."
      redirect_to '/'
    else
      @user.save
      sign_in @user
      if !@user.admin
        Apartment::Tenant.switch(Company.find(@user.company_id).company_name.gsub(/'/,'').gsub(/\s/,''))
      end
      redirect_to "/" and return
    end
    
  end

  private

  #Param checking method for creation of a new user 
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
