class CampaignsController < ApplicationController
  before_action :authenticate_user!

  def index
    @campaigns = current_user.campaigns.all
  end

  def new
    @campaign = Campaign.new
    @script = @campaign.scripts.build
  end

  def create
    @campaign = Campaign.create(campaign_params)
    @caller = Caller.create(campaign_id: @campaign.id, user_id: current_user.id, is_campaign_owner: true)
    if @campaign.save && @caller.save
      flash[:success] = "The #{@campaign.name} campaign has been created."
      redirect_to new_campaign_script_path(@campaign)
    else
      flash[:error] = "Campaign could not be created."
      render :new
    end
  end

  def show
    @campaign = current_user.campaigns.find(params[:id])
    @is_admin = current_user.callers.where("campaign_id = ?", params[:id]).pluck(:is_campaign_owner).first
    @resource = User.new
    @caller = Caller.new
  end

  protected

  def campaign_params
    params.require(:campaign).permit(:name, :summary, scripts_attributes: [:script_id, :copy])
  end

end
