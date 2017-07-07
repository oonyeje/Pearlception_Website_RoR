class SuppliersDistributorsController < ApplicationController
  def index
    @distributors = Distributor.page(params[:page]).per(5)
    @suppliers = Supplier.page(params[:page]).per(5)
  end

  def new
    @type = params[:type]
    if @type == "supplier" 
      @supplier = Supplier.new
    else
      @distributor = Distributor.new
    end
  end

  def create
    if params["supplier"] != nil 
      @supplier = Supplier.new(supplier_distributor_params("supplier"))
      if @supplier.save
        redirect_to :action => 'index'
      else
        flash[:alert] = @supplier.errors.full_messages.to_sentence
        redirect_to :action => 'new'
      end
    else
      @distributor = Distributor.new(supplier_distributor_params("distributor"))
      if @distributor.save
        redirect_to :action => 'index'
      else
        flash[:alert] = @distributor.errors.full_messages.to_sentence
        redirect_to :action => 'new'
      end
    end
  end

  def edit
    if params[:type] == "supplier" 
      @supplier = Supplier.find(params[:id])
      @type = "supplier"
    else
      @distributor = Distributor.find(params[:id])
      @type == "distributor"
    end
  end

  def update
    if params["supplier"] != nil
      @supplier = Supplier.find params[:id]
      if @supplier.update (supplier_distributor_params params[:type])
        flash[:message] = "Update to supplier was successful"
        redirect_to :action => 'index'
      else
        flash[:alert] = @supplier.errors.full_messages.to_sentence
        redirect_to :action => 'edit'
      end
    else
      @distributor = Distributor.find params[:id]
      if @distributor.update (supplier_distributor_params params[:type])
        flash[:message] = "Update to supplier was successful"
        redirect_to :action => 'index'
      else
        flash[:alert] = @distributor.errors.full_messages.to_sentence
        redirect_to :action => 'edit'
      end
    end
    
    
   end

  def show
  end

  def 

  def destroy
    if params[:type] == "supplier"
      @supplier = Supplier.find(params[:id])
      @supplier.destroy!
      redirect_to :action => 'index', :notice => "#{@supplier.name} has been deleted"
    else
      @distributor = Distributor.find(params[:id])
      @distributor.destroy!
      redirect_to :action => 'index', :notice => "#{@distributor.name} has been deleted"
    end
  end

  def supplier_distributor_params type
    if type == "supplier" || params["supplier"] != nil
      params.require(:supplier).permit(:name)
    else
      params.require(:distributor).permit(:name)
    end
  end
end
