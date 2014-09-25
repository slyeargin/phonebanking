feature "Adding a new campaign" do

  background do
    @user = Fabricate(:user)
    visit '/'
    click_link 'Login'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_on 'Sign in'
  end

  scenario "Happy Path" do
    page.should have_content("Your Campaigns")
    current_path.should == campaigns_path
    click_on "Create a Campaign"
    page.should have_content("Create a Campaign")
    current_path.should == new_campaign_path
    fill_in "Name", with: "My Fantastic Campaign"
    fill_in "Summary", with: "It's to let people know how awesome stuff is."
    click_on "Create Campaign"
    page.should have_content("The My Fantastic Campaign campaign has been created.")
    fill_in "Copy", with: "Hello, I'm calling today to talk about stuff."
    click_on "Add Script"
    page.should have_content("Your script was added to your campaign.")
    fill_in "First Name", with: "Jane"
    fill_in "Last Name", with: "Public"
    fill_in "Phone", with: "5555555555"
    fill_in "ZIP Code", with: "37206"
    click_button "Add Target to Campaign"
    page.should have_content("Jane Public was added to your campaign.")
    page.should have_content("My Fantastic Campaign")
    page.should_not have_content("You don't belong to any campaigns.")
  end

end
