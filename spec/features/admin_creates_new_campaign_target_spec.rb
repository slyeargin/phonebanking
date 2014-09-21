feature "Admin adds a campaign target" do
  background do
    @user1 = Fabricate(:user)
    @user2 = Fabricate(:user)
    @statehouse2014 = Fabricate(:campaign, name: "State House 2014", summary: "GOTV")
    @caller1 = Fabricate(:caller, campaign_id: @statehouse2014.id, user_id: @user1.id, is_campaign_owner: true)
    @caller2 = Fabricate(:caller, campaign_id: @statehouse2014.id, user_id: @user2.id, is_campaign_owner: false)
  end

  scenario "Happy path, admin creates a target" do
    visit '/'
    click_link 'Login'
    fill_in "Email", with: @user1.email
    fill_in "Password", with: @user1.password
    click_on 'Sign in'
    visit campaigns_path
    click_link "State House 2014"
    click_on "Add Target"
    fill_in "First Name", with: "Jane"
    fill_in "Last Name", with: "Public"
    fill_in "Phone", with: "5555555555"
    fill_in "ZIP Code", with: "37206"
    click_button "Add Target to Campaign"
    current_path.should eq campaign_path(@statehouse2014)
    page.should have_content("Jane Public was added to your campaign.")
  end

  scenario "Happy path, non-admin cannot create a target" do
    visit '/'
    click_link 'Login'
    fill_in "Email", with: @user2.email
    fill_in "Password", with: @user2.password
    click_on 'Sign in'
    visit campaigns_path
    click_link "State House 2014"
    page.should_not have_content("Add Target")
    current_path.should eq campaign_path(@statehouse2014)
  end
end
