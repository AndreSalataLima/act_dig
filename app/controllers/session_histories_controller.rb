class SessionHistoriesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @session_histories = @user.session_histories
  end

  def show
  end
end
