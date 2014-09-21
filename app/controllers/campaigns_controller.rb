class CampaignsController < ApplicationController
  before_action :authenticate_user!

  def index
    @campaigns = current_user.campaigns.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.create!(campaign_params)
    @caller = Caller.create!(campaign_id: @campaign.id, user_id: current_user.id, is_campaign_owner: true)
     if @campaign.save && @caller.save
      redirect_to campaigns_path, notice: "The #{@campaign.name} campaign has been created."
    else
      flash.alert = "Campaign could not be created."
      render :new
    end
  end

  def show
    @campaign = current_user.campaigns.find(params[:id])
    @is_admin = current_user.callers.where("campaign_id = ?", params[:id]).pluck(:is_campaign_owner).first
  end

  protected

  def campaign_params
    params.require(:campaign).permit(:name, :summary)
  end

end
