class SensorsController < ApplicationController
  before_action :set_sensor, only: [:show, :edit]

  def show
    @sensor
  end

  def edit
    @sensor
  end


  private


  def sensor_params
    params.require(:sensor).permit(:exercise_id, :distance, :speed, :time)
  end

  def set_sensor
    @sensor = Sensor.find_by(id: params[:id])
    redirect_to(user_session_exercise_path(@user, @session, @exercise), alert: "Sensor not found.") if @sensor.nil?
  end

end
