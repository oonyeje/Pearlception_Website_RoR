class GradesController < ApplicationController
    before_filter :deny_to_visitors

	def new

	end

    def index
        @grades = Grade.all
    end

    def deny_to_visitors
        redirect_to "/signin" unless user_signed_in? && !current_user.admin?
    end

	def create
		Grade.create(grades_params)
		redirect_to '/grades'
	end

private
	def grades_params
		params.require(:grade).permit(:Full_name,:Short_name, :Width_min,:Width_max,:Height_min,:Height_max, :Length_min,:Length_max)
	end

end
