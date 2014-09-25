class UserInvitationsController < Devise::InvitationsController
  def create
    puts params
    @user = User.invite!(invite_params)
    @caller = Caller.create!(campaign_id: @user.invited_to_campaign, user_id: @user.id, is_campaign_owner: false)
    @caller.save

    super
  end

  protected

  def invite_params
    params.require(:user).permit(:email, :invited_to_campaign)
  end

end
