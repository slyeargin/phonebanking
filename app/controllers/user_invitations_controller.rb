class UserInvitationsController < Devise::InvitationsController
  def create
    super

    @caller = Caller.create!(campaign_id: resource.invited_to_campaign, user: resource, is_campaign_owner: false)
    @caller.save

  end

  protected

  def invite_params
    params.require(:user).permit(:email, :invited_to_campaign)
  end

end
