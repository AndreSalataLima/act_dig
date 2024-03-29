class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user
  end


  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    # strong parameters para User
    params.require(:user).permit(:name, :age, :weight, :height, :level, :objective)
  end

  def set_user
    @user = User.find_by(id: params[:id])
    redirect_to(users_path, alert: "User not found.") if @user.nil?
  end

end
