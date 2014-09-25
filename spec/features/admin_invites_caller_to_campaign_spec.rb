require 'pry'

feature "Adding a new campaign" do

  background do
    @user = Fabricate(:user)
    visit '/'
    click_link 'Login'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_on 'Sign in'
    visit '/'
    page.should have_content("Your Campaigns")
    current_path.should == campaigns_path
    click_on "Create a Campaign"
    page.should have_content("Create a Campaign")
    current_path.should == new_campaign_path
    fill_in "Name", with: "My Fantastic Campaign"
    fill_in "Summary", with: "It's to let people know how awesome stuff is."
    click_on "Create Campaign"
  end

  scenario "Happy Path, admin adds a user to a campaign" do
    visit '/'
    click_on "My Fantastic Campaign"
    fill_in "Email", with: "samantha@yearg.in"
    click_on "Invite"
    @invitee = User.where(email: "samantha@yearg.in").first
    @campaign = Campaign.where(name: "My Fantastic Campaign").first
    @caller = Caller.where(user_id: @invitee.id, campaign_id: @campaign.id, is_campaign_owner: false).first
    binding.pry
    @invitee.should_not == nil
    @campaign.should_not == nil
    @campaign.name.should == "My Fantastic Campaign"
    @caller.user_id.should == @invitee.id
    @caller.campaign_id.should == @campaign.id
  end

  scenario "Happy Path, admin adds a user to two campaigns" do
    @campaign2 = Fabricate(:campaign, name: "Subpar Campaign", summary: "It's okay")
    @admincaller = Fabricate(:caller, user_id: @user.id, campaign_id: @campaign2.id, is_campaign_owner: true)
    visit '/'
    click_on "My Fantastic Campaign"
    fill_in "Email", with: "samantha@yearg.in"
    click_on "Invite"
    @invitee = User.where(email: "samantha@yearg.in").first
    @campaign1 = Campaign.where(name: "My Fantastic Campaign").first
    @caller1 = Caller.where(user_id: @invitee.id, campaign_id: @campaign1.id, is_campaign_owner: false).first
    visit campaigns_path
    click_on "Subpar Campaign"
    fill_in "Email", with: "samantha@yearg.in"
    click_on "Invite"
    @caller2 = Caller.where(user_id: @invitee.id, campaign_id: @campaign2.id, is_campaign_owner: false).first
    @invitee.should_not == nil
    @campaign1.should_not == nil
    @campaign1.name.should == "My Fantastic Campaign"
    @caller1.user_id.should == @invitee.id
    @caller1.campaign_id.should == @campaign1.id
    @caller2.user_id.should == @invitee.id
    @caller2.campaign_id.should == @campaign2.id
  end

end
