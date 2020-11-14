class UsersController < ApplicationController

  # GET /users/new
  def new
     @user=User.new
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


end
