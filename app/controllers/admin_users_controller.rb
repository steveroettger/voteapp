class ContestantsController < ApplicationController
  before_filter :authenticate_admin_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @admin_users = AdminUser.all
  end
  
  def new
    @admin_user = AdminUser.new
  end
  
  def create
    @admin_user = AdminUser.new(params[:admin_user])
    if @admin_user.save
      redirect_to @admin_user, notice: 'New admin profile has been created.'
    else
      render 'new'
    end
  end
  
  def show 
    @admin_user = AdminUser.find(params[:id])
  end
  
  def edit
    @admin_user = AdminUser.find(params[:id])
  end
  
  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(params[:admin_user])
      redirect_to @admin_user, notice: 'Admin profile has been updated.'
    else
      render 'edit'
    end
  end
  
  def destroy
    @admin_user = AdminUser.find(params[:id])
    @admin_user.destroy 
  end
end