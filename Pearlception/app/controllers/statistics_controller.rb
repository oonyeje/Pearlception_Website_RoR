class StatisticsController < ApplicationController

    def index
        puts Grade.all
        if params[:from_date] != nil && params[:to_date] != nil
            from_date = Date.strptime(params[:from_date], '%m/%d/%Y')
            to_date = Date.strptime(params[:to_date], '%m/%d/%Y')
            runs = Run.where(:runDate => from_date.beginning_of_day..to_date.end_of_day)
        else
            runs = Run.all
        end
        respond_to do |f|
            f.html
            f.json {render :json => {grades:Grade.all,runData:runs}}
        end 
    end
end
