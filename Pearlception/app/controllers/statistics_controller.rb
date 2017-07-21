class StatisticsController < ApplicationController

    def index
        @suppliers = Supplier.all 
        @distributors = Distributor.all
        #filterUsed = false
        runs = Run.all
        if params[:from_date] != nil && params[:to_date] != nil
            from_date = Date.strptime(params[:from_date], '%m/%d/%Y')
            to_date = Date.strptime(params[:to_date], '%m/%d/%Y')
            #runs = Run.where(:runDate => from_date.beginning_of_day..to_date.end_of_day)
            runs = runs.by_date(from_date.beginning_of_day..to_date.end_of_day)
        end

        if params[:supplier] != nil
            runs = runs.by_supplier(params[:supplier])
        end

        if params[:distributor] != nil
            runs = runs.by_distributor(params[:distributor])
        end
        #    runs = Run.all
        #end
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
