class RulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rule, only: [:edit, :update]

  def index
    @rule = Rule.new
  end

  def create
    @rule = Rule.new(rule_params)
    if @rule.save
      redirect_to habits_path
    else
      render 'index'
    end
  end

  def edit
  end

  def update
    if @rule.update(rule_params)
      redirect_to habits_path
    else
      render 'edit'
    end
  end

  private

  def rule_params
    params.require(:rule).permit(:if_1, :if_2, :if_3, :if_4, :if_5, :then_1, :then_2, :then_3,
                                 :then_4, :then_5).merge(user_id: current_user.id)
  end

  def set_rule
    @rule = Rule.find(params[:id])
  end
end
