class TroublesController < ApplicationController
  before_action :authenticate_user!

  def index
    @troubles = current_user.troubles.all.order(created_at: :desc)
    @trouble = Trouble.new
  end

  def new
  end

  def create
    trouble = Trouble.new(trouble_params)
    render json: { trouble: trouble } if trouble.save
  end

  private

  def trouble_params
    params.require(:trouble).permit(:message_type, :worry).merge(user_id: current_user.id)
  end
end
