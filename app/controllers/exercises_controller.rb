class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  before_action :set_session

  def index
    @exercises = @session.exercises
  end

  def show
    @exercise
  end

  def new
    @exercise = @session.exercises.build
  end

  def edit
    @exercise
  end

  def create
    @exercise = @session.exercises.build(exercise_params)
    if @exercise.save
      redirect_to session_exercise_path(@session, @exercise)
    else
      render 'new'
    end
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to @exercise
    else
      render 'edit'
    end
  end

  def destroy
    @exercise.destroy
    redirect_to exercises_path
  end

  private

  def exercise_params
    params.require(:exercise).permit(:machine, :duration, :weight, :repetition, :serie)
  end

  def set_exercise
    @exercise = Exercise.find_by(id: params[:id])
    redirect_to(exercises_path, alert: "Exercise not found.") if @exercise.nil?
  end

  def set_session
    @session = Session.find(params[:session_id])
    @user = @session.user
  end

end
