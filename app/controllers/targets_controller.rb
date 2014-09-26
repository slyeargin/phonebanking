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
    @is_admin = current_user.callers.where("campaign_id = ?", params[:id]).pluck(:is_campaign_owner).first
    @target = Target.find(params[:id])
    @next_target = @campaign.targets.where("has_been_called = false").where("id != #{@target.id}").order("RANDOM()").first
    if @target == nil || @target.has_been_called == true && @is_admin == false
      redirect_to campaign_path(@campaign)
    end
    @response = Response.new
    @script = Script.where("campaign_id = ?", params[:campaign_id]).pluck(:copy).first
  end

  def update
    @target = Target.find(params[:id])
    @target.assign_attributes(target_params)
    @target.save!
    @uncalled = @campaign.targets.where("has_been_called = false").where("id != #{@target.id}").order("RANDOM()").first
    if @uncalled == nil
      redirect_to campaign_path(@campaign)
    else
      redirect_to campaign_target_path(@campaign, @uncalled)
    end
  end


  protected

  def target_params
    params.require(:target).permit(:first_name, :last_name, :address1, :city, :state, :phone_number, :zipcode, :has_been_called, responses_attributes: [:response_id, :question, :answer, :contacted_when, :campaign_id])
  end

  def load_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

end
