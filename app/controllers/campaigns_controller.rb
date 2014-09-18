class CampaignsController < ApplicationController
  before_action :authenticate_user!

  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.create!(campaign_params)
     if @campaign.save
      redirect_to campaigns_path, notice: "The #{@campaign.name} campaign has been created."
    else
      flash.alert = "Campaign could not be created."
      render :new
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  protected

  def campaign_params
    params.require(:campaign).permit(:name, :summary)
  end

end
