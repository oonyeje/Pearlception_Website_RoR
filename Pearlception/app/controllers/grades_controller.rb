class GradesController < ApplicationController
    before_filter :deny_to_visitors

    def index
        @grades = Grade.all
    end

    def deny_to_visitors
        redirect_to "/signin" unless user_signed_in? && !current_user.admin?
    end
end
