class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
    campaign = Campaign.create!(campaign_params)
    redirect_to campaigns_path, notice: "The #{campaign.name} campaign has been created."
  end

  protected

  def campaign_params
    params.require(:campaign).permit(:name, :summary)
  end

end
