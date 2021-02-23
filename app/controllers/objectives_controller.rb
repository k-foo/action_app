class ObjectivesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_objective, only: [:edit, :show, :destroy, :update]

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
    @objective.destroy
  end

  def edit
  end

  def update
    @objective.update(objective_params)
  end

  def show
  end

  private

  def objective_params
    params.require(:objective).permit(:title, :category_id, :wish, :outcome, :obstacle, :plan).merge(user_id: current_user.id)
  end

  def set_objective
    @objective = current_user.objectives.find(params[:id])
  end
end
