class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = t ".warning"
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = t ".success"
      redirect_to @user
      # Handle a successful save.
    else
      render :new
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
  end
end
