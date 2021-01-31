class HabitsController < ApplicationController
  before_action :authenticate_user!

  def index
    # 合計回数時に使用
    @user = Habit.where(user_id: current_user.id)
    @habit = Habit.new
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
