feature "Viewing campaigns" do

  background do
    @user1 = Fabricate(:user)
    @user2 = Fabricate(:user)
    @user3 = Fabricate(:user)
    @campaign1 = Fabricate(:campaign, name: "My Campaign", summary: "It's pretty good.")
    @campaign2 = Fabricate(:campaign, name: "Nacho Campaign", summary: "I don't know anything about it.")
    @caller1 = Fabricate(:caller, campaign_id: @campaign1.id, user_id: @user1.id, is_campaign_owner: true)
    @caller2 = Fabricate(:caller, campaign_id: @campaign1.id, user_id: @user2.id, is_campaign_owner: false)
    visit '/'
    click_link 'Login'
  end

  scenario "Happy Path, campaign owner" do
    fill_in "Email", with: @user1.email
    fill_in "Password", with: @user1.password
    click_on 'Sign in'
    visit '/'
    click_on "View Campaigns"
    page.should have_content("Your Campaigns")
    page.should have_content("My Campaign")
    page.should_not have_content("Nacho Campaign")
    current_path.should == campaigns_path
  end

  scenario "Happy Path, belongs to a campaign, non-owner" do
    fill_in "Email", with: @user2.email
    fill_in "Password", with: @user2.password
    click_on 'Sign in'
    visit '/'
    click_on "View Campaigns"
    page.should have_content("Your Campaigns")
    page.should have_content("My Campaign")
    page.should_not have_content("Nacho Campaign")
    current_path.should == campaigns_path
  end

  scenario "Happy Path, no campaigns" do
    fill_in "Email", with: @user3.email
    fill_in "Password", with: @user3.password
    click_on 'Sign in'
    visit '/'
    click_on "View Campaigns"
    page.should have_content("Your Campaigns")
    page.should have_content("You don't belong to any campaigns.")
    page.should_not have_content("My Campaign")
    page.should_not have_content("Nacho Campaign")
    current_path.should == campaigns_path
  end



end
