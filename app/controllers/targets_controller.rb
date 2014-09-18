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

  def show
    @campaign = Campaign.find(params[:campaign_id])
    @target = Target.find(params[:id])
    @response = Response.new
  end

  def update
    @target = Target.find(params[:id])
    @target.update_attributes(target_params)

    params[:target][:responses_attributes].each do |k, v|
      v.merge(:campaign_id => @campaign.id, :contacted_when => Time.now)
      answer = response_params(v)
      @response = @target.responses.build(answer)
    end
    redirect_to campaign_path(@campaign)
  end

  protected

  def target_params
    params.require(:target).permit(:first_name, :last_name, :phone_number, :zipcode, :has_been_called)
  end

  def response_params(params)
    params.require(:response).permit(:question, :answer, :contacted_when, :campaign_id)
  end

  def load_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

end
