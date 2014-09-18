feature "Viewing campaigns" do

  background do
    @user = Fabricate(:user)
    visit '/'
    click_link 'Login'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_on 'Sign in'
  end

  scenario "Happy Path" do
    visit '/'
    click_on "View Campaigns"
    page.should have_content("Your Campaigns")
    page.should have_content("You do not have any campaigns.")
    current_path.should == campaigns_path
  end

end
