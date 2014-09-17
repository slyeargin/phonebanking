feature "Viewing campaigns" do
  scenario "Happy Path" do
    visit '/'
    click_on "View Campaigns"
    page.should have_content("Your Campaigns")
    page.should have_content("You do not have any campaigns.")
    current_path.should == campaigns_path
  end

end
