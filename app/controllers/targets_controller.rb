class TargetsController < ApplicationController

  before_action :load_campaign

  def new
    @target = Target.new
    @campaign = Campaign.find(params[:campaign_id])
  end

  def create
    @target = @campaign.targets.build(target_params)
    if @target.save
      redirect_to campaign_path(@campaign), notice: "#{@target.first_name} #{@target.last_name} was added to your campaign."
    else

      flash.alert = "Target could not be created."
      render :new
    end
  end

  protected

  def target_params
    params.require(:target).permit(:first_name, :last_name, :phone_number, :zipcode)
  end

  def load_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

end
