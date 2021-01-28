class EncouragementsController < ApplicationController
  before_action :authenticate_user!
  # before_action :in_advance_trouble, only: [:index, :new, :create]

  def index
    @encouragements = current_user.encouragements.all.order(created_at: :desc)
    # trouble = Trouble.create(user_id: user_id, trouble_id: trouble_id)
    @trouble = Trouble.find(params[:trouble_id])
    @encouragement = Encouragement.new
    @encouragement.user_id = current_user.id
    # render "troubles/index"
  end

  def new
  end

  def create
    encouragement = Encouragement.new(encouragement_params)
    # render json: { encouragement: encouragement } if encouragement.save
    # binding.pry
    if encouragement.save!
      render json: {encouragement: encouragement}
      # render json: {encouragement: encouragement} and return
    end
    redirect_to objectives_path
  end

  private
  
  # def in_advance_trouble
  # end
 
  def encouragement_params
    # params.require(:encouragement).permit(:encouragement)
    # それは解除できた↓
    params.permit(:encouragement).merge(user_id: current_user.id, trouble_id: params[:trouble_id])
    # NoMethodError: undefined method `permit' for "あああ":Stringになる↓
    # params.require(:encouragement).permit(:encouragement).merge(user_id: current_user.id, trouble_id: params[:trouble_id])
  end

end
