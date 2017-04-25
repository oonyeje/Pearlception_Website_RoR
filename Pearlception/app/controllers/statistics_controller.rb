class StatisticsController < ApplicationController

    def index
        if params[:from_date] != nil && params[:to_date] != nil
            from_date = Date.strptime(params[:from_date], '%m/%d/%Y')
            to_date = Date.strptime(params[:to_date], '%m/%d/%Y')
            runs = Run.where(:runDate => from_date.beginning_of_day..to_date.end_of_day)
        else
            runs = Run.all
        end
        puts runs.inspect
        oysterData = []
        all_oysters = []
        runs.each do |run|
            oysters = Oyster.where(run_id: run.id).to_a
            data = {"run": run, "oysters": oysters}
            oysterData.push(data)
            all_oysters.concat(oysters)
        end
        respond_to do |f|
            f.html
            f.json {render :json => {grades:Grade.all,oysterData:oysterData,allOysters:all_oysters}}
        end 
    end
end
