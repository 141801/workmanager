class UsersController < ApplicationController

  # GET /users/new


  def index
     @users = User.all
  end

  def new
     @user = User.new
  end


 def create
    @user = User.new(user_params)
    if @user.save
     # session[:user_id] = @user.id
      flash[:success] = "Welcome to the alpha blog #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end



  def show
    @user=User.find(params[:id])
    @worktimes = @user.worktimes
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
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
end
