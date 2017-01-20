class CompaniesController < ApplicationController
  require 'securerandom'
  before_filter :deny_to_visitors

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.company_token = SecureRandom.uuid

    if @company.save
      redirect_to :action => 'index'
    else
      flash[:alert] = @company.errors.full_messages.to_sentence
      redirect_to :action => 'new'
    end
  end

  def index
    @companies = Company.all
  end

  def deny_to_visitors
    redirect_to "/signin" unless user_signed_in? && current_user.admin?
  end

  def company_params
    params.require(:company).permit(:company_name, :company_token)
  end
end
