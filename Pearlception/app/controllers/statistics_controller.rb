class StatisticsController < ApplicationController

    def index
        if params[:from_date] != nil && params[:to_date] != nil
            from_date = Date.parse params[:from_date]
            to_date = Date.parse params[:to_date]
            runs = Run.where(:runDate => from_date.beginning_of_day..to_date.end_of_day)
            puts runs.inspect
        else
            runs = Run.all
            puts runs.inspect
        end
    end
end
