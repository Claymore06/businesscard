class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_loginuser!
  
  def set_company
    id = params[:company_id] ? params[:company_id] : params[:id]
    @company = Company.find(id)
  end

  def set_group
    id = params[:group_id] ? params[:group_id] : params[:id]
    @group = @company.groups.find(id)
  end

  def set_user
    id = params[:user_id] ? params[:user_id] : params[:id]
    @user = @group.users.find(id)
  end

end
