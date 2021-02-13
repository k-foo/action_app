class RulesController < ApplicationController
  def index
    @rule = Rule.new
  end

  def create
    rule = Rule.create(rule_params)
  end

  private

  def rule_params
    params.require(:rule).permit(:if_1, :if_2, :if_3, :if_4, :if_5, :then_1, :then_2, :then_3,
                                 :then_4, :then_5).merge(user_id: current_user.id)
  end
end
