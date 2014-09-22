class ScriptsController < ApplicationController

  before_action :load_campaign
  before_action :authenticate_user!

  def new
    @script = Script.new
    @campaign = Campaign.find(params[:campaign_id])
  end

  def create
    @script = @campaign.scripts.build(script_params)
    if @script.save
      redirect_to new_campaign_target_path(@campaign), notice: "Your script was added to your campaign."
    else
      flash.alert = "Script could not be created."
      render :new
    end
  end

  protected

  def script_params
    params.require(:script).permit(:copy, :campaign_id)
  end

  def load_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

end
