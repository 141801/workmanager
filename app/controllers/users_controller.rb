class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:show, :edit, :update]
  before_action :require_admin, only: [:destroy, :index]

  def index
     @users = User.all
  end

  def new
     @user = User.new
  end


 def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the alpha blog #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to worktimes_path
    else
      render 'edit'
    end
  end

  def show
    @user=User.find(params[:id])
    @worktimes = @user.worktimes

    #require 'date'

    @bydate = @worktimes.select("date(ontime) , SUM(offtime-ontime)  ").where(ontime: Time.current.beginning_of_month..Time.current.end_of_month).group("date(ontime)")
  
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.worktimes.destroy
    @user.destroy
    flash[:danger] = "User and all worktimes created by user have been deleted"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end


  def set_user
    begin 
       @user = User.find(params[:id])
    rescue 
       flash[:danger] = " danger  operation detected"
       redirect_to root_path 
    end
  end


  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to root_path
    end
  end

  class Datetimes
     attr_accessor :date, :totaltime
  end
end

