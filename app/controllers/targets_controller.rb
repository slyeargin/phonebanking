class TargetsController < ApplicationController

  before_action :load_campaign
  before_action :authenticate_user!

  def new
    @target = Target.new
    @campaign = Campaign.find(params[:campaign_id])
  end

  def create
    @target = @campaign.targets.build(target_params)
    if @target.save
      flash[:success] = "#{@target.first_name} #{@target.last_name} was added to your campaign."
      redirect_to campaign_path(@campaign)
    else
      flash.alert = "Target could not be created."
      render :new
    end
  end

  def show
    @campaign = Campaign.find(params[:campaign_id])
    @target = Target.find(params[:id])
    @response = Response.new
    @script = Script.where("campaign_id = ?", params[:campaign_id]).pluck(:copy).first
  end

  def update
    @target = Target.find(params[:id])
    @target.assign_attributes(target_params)
    @target.save!
    redirect_to campaign_path(@campaign)
  end


  protected

  def target_params
    params.require(:target).permit(:first_name, :last_name, :phone_number, :zipcode, :has_been_called, responses_attributes: [:response_id, :question, :answer, :contacted_when, :campaign_id])
  end

  def load_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

end
