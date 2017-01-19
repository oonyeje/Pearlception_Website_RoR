class RunsController < ApplicationController
    def index     
        @runs = Run.all if params[:limit] == nil
        @runs = Run.take(params[:limit]) if params[:limit] != nil
        
        respond_to do |format|
            format.html
            format.json {render json: @runs}
        end 
    end

end
