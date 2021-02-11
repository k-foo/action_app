class HabitsController < ApplicationController
  before_action :authenticate_user!

  def index
    @habit = Habit.new
    @count_1 = Habit.includes(:habits).where(user_id: current_user.id).where(count_1: 1).size
    @count_2 = Habit.includes(:habits).where(user_id: current_user.id).where(count_2: 1).size
    @count_3 = Habit.includes(:habits).where(user_id: current_user.id).where(count_3: 1).size
    @count_4 = Habit.includes(:habits).where(user_id: current_user.id).where(count_4: 1).size
    @count_5 = Habit.includes(:habits).where(user_id: current_user.id).where(count_5: 1).size
    @restart_1 = Habit.includes(:habits).where(user_id: current_user.id).where(restart_1: 1).size
    @restart_2 = Habit.includes(:habits).where(user_id: current_user.id).where(restart_2: 1).size
    @restart_3 = Habit.includes(:habits).where(user_id: current_user.id).where(restart_3: 1).size
    @restart_4 = Habit.includes(:habits).where(user_id: current_user.id).where(restart_4: 1).size
    @restart_5 = Habit.includes(:habits).where(user_id: current_user.id).where(restart_5: 1).size
  end

  def new
  end

  def create
    habit = Habit.create(habit_params)
  end

  private

  def habit_params
    params.require(:habit).permit(:count_1, :count_2, :count_3, :count_4, :count_5, :restart_1, :restart_2, :restart_3, :restart_4,:restart_5).merge(user_id: current_user.id)
  end
end
