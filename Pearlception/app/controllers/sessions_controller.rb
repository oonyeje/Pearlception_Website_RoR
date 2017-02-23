class SessionsController < Devise::RegistrationsController
  include ApplicationHelper
  #def new
   #   Apartment::Tenant.switch!
  #end

  def create
    binding.pry
    resource = warden.authenticate!(:scope => :user)
    binding.pry
    sign_in(:user, resource)
    if !current_user.admin
      Apartment::Tenant.switch!(Company.find(current_user.company_id).company_name.gsub(/'/,'').gsub(/\s/,''))
    end
    redirect_to "/"
  end
end