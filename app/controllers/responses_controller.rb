class ResponsesController < ApplicationController

  # before_action :load_campaign
  # before_action :load_target
  before_action :authenticate_user!

  def new

  end

  def create

  end

  def show
    @response = Response.find(params[:id])
  end


  protected

  def response_params
    params.require(:response).permit(:question, :answer)
  end

  # def load_campaign
  #   @campaign = Campaign.find(params[:campaign_id])
  # end
  #
  # def load_target
  #   @target = Target.find(params[:target_id])
  # end

end
