class HabitsController < ApplicationController
  before_action :authenticate_user!

  def index
    @habit = Habit.new
    # カレントユーザーの習慣合計を表示
    @counts = %w[count_].product(%w[1 2 3 4 5]).map(&:join).map do |clm|
      [clm, Habit.where(user_id: current_user.id, clm => 1).count]
    end.to_h
    # カレントユーザーのリスタート合計を表示
    @restarts = %w[restart_].product(%w[1 2 3 4 5]).map(&:join).map do |clm|
      [clm, Habit.where(user_id: current_user.id, clm => 1).count]
    end.to_h
    # カレントユーザーのイフゼンルールを表示
    @rule = Rule.where(user_id: current_user.id).last
  end

  def new
  end

  def create
    habit = Habit.create(habit_params)
  end

  private

  def habit_params
    params.require(:habit).permit(:count_1, :count_2, :count_3, :count_4, :count_5, :restart_1, :restart_2, :restart_3,
                                  :restart_4, :restart_5).merge(user_id: current_user.id)
  end
end
