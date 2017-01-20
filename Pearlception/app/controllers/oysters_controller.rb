class OystersController < ApplicationController
  def show
  end

  def index
    @oysters = Oyster.where(:run_id => params[:result_id])
    @oysters_count = @oysters.count
    @oysters = @oysters.page(params[:page]).per(5)
  end
end
