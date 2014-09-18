feature "Admin adds a campaign target" do
  background do
    @user = Fabricate(:user)
    visit '/'
    click_link 'Login'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_on 'Sign in'
  end

  scenario "Happy path, create a target" do
    statehouse2014 = Fabricate(:campaign, name: "State House 2014", summary: "GOTV")
    visit campaigns_path
    click_link "State House 2014"
    click_on "Add Target"
    fill_in "First Name", with: "Jane"
    fill_in "Last Name", with: "Public"
    fill_in "Phone", with: "5555555555"
    fill_in "ZIP Code", with: "37206"
    click_button "Add Target to Campaign"
    current_path.should eq campaign_path(statehouse2014)
    page.should have_content("Jane Public was added to your campaign.")
  end
end
