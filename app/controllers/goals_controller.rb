class GoalsController < ApplicationController
  before_action :check_signed_in
  before_action :own_or_public_goal, only: [:show]

  def index
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id

    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  protected
  def goal_params
    params.require(:goal).permit(:title, :body, :goal_date, :public)
  end
end
