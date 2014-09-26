class CallersController < ApplicationController

  def destroy
    @campaign = Campaign.find(params[:campaign_id])
    @caller = Caller.find(params[:id])
    @caller.destroy
    redirect_to campaign_path(@campaign)
  end

  protected

  def caller_params
    params.require(:caller).permit(:id, :campaign_id, :user_id, :is_campaign_owner)
  end

end
