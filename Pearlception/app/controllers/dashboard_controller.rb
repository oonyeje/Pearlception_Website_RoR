class DashboardController < ApplicationController
    before_filter :deny_to_visitors

    def index
<<<<<<< HEAD
        @results = Result.page(params[:page]).per(5)
=======
      #This is a temporary fix until runs and results models are properly discussed with bobby
        #@results = Result.page(params[:page]).per(5)
        if current_user.admin?
          puts params
          @results = Hash.new
          names = (Company.pluck :company_name) - ["IVA"]
          names.map!{|tenant| tenant.gsub(/'/,'').gsub(/\s/,'')}
          names.each do
              |name|

              Apartment::Tenant.switch!(name.gsub(/'/,'').gsub(/\s/,''))

              if params[:company] == name 
                  @results[name.gsub(/'/,'').gsub(/\s/,'')] = {results: Run.page(params[:page]).per(5), active: true, name: name}
              else
                  @results[name.gsub(/'/,'').gsub(/\s/,'')] = {results: Run.page(params[:page]).per(5), active: false}
              end
          end
          #binding.pry
          Apartment::Tenant.switch!
        else
          @results = Run.page(params[:page]).per(5)
        end

>>>>>>> 66dfc7d12c7a612332c9b8de8f32df39a0d362ce
    end

    def deny_to_visitors
      redirect_to "/signin" unless user_signed_in?
    end

end
