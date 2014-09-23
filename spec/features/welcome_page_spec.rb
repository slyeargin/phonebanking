feature "Welcome Page" do

  scenario "is displayed when loading the site, not logged in" do
    visit '/'
    expect(page).to have_content("Remote Phonebanking")
    expect(page).to have_content("Imagine a world …
… without call sheets. Without burner phones. Without a room full of people who can't hear themselves talking. Without a week between a call placed and the data entered.

That world is here. Now.")
  end

  scenario "user is redirected if logged in" do
    @user1 = Fabricate(:user)
    visit '/'
    click_link 'Login'
    fill_in "Email", with: @user1.email
    fill_in "Password", with: @user1.password
    click_on 'Sign in'
    page.should have_content("Your Campaigns")
    page.should have_content("You don't belong to any campaigns.")
    current_path.should == campaigns_path
  end
end
