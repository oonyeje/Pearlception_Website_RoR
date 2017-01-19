class DashboardController < ApplicationController
    before_filter :deny_to_visitors

    def index

    end

    def deny_to_visitors
      redirect_to "/signin" unless user_signed_in?
    end

end
