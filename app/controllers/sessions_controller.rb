class SessionsController < ApplicationController
  before_action :set_user
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  def index
    @sessions = @user.sessions
  end

  def show
    @session
  end

  def new
    @session = @user.sessions.build
  end

  def edit
    @session
  end

  def create
    @session = @user.sessions.build(session_params)
    if @session.save
      redirect_to user_session_path(@user, @session)
    else
      render 'new'
    end
  end

  def update
    if @session.update(session_params)
      redirect_to user_session_path(@user, @session)
    else
      render 'edit'
    end
  end

  def destroy
    @session.destroy
    redirect_to user_sessions_path(@user)
  end

  private

  def session_params
    params.require(:session).permit(:user_id, :timestamp)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_session
    @session = @user.sessions.find_by(id: params[:id])
    redirect_to(user_sessions_path(@user), alert: "Session not found.") if @session.nil?
  end

end
