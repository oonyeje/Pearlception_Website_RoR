class DashboardController < ApplicationController
    before_filter :deny_to_visitors

    def index
        @results = Result.page(params[:page]).per(5)
    end

    def deny_to_visitors
      redirect_to "/signin" unless user_signed_in?
    end

end
