class ObjectivesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_objective, only: [:edit, :show]

  def index
    @objectives = current_user.objectives.all.order(created_at: :desc)
  end

  def new
    @objective = Objective.new
  end

  def create
    @objective = Objective.new(objective_params)
    if @objective.save
      redirect_to objectives_path
    else
      render :new
    end
  end

  def destroy
    objective = Objective.find(params[:id])
    objective.destroy
  end

  def edit
  end

  def update
    objective = Objective.find(params[:id])
    objective.update(objective_params)
    redirect_to habits_path
  end

  def show
  end

  private

  def objective_params
    params.require(:objective).permit(:title, :category_id, :wish, :outcome, :obstacle, :plan).merge(user_id: current_user.id)
  end

  def set_objective
    @objective = Objective.find(params[:id])
  end
end
