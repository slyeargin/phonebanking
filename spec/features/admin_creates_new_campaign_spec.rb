feature "Adding a new campaign" do
  scenario "Happy Path" do
    visit '/'
    click_on "View Campaigns"
    page.should have_content("Your Campaigns")
    current_path.should == campaigns_path
    click_on "Create a Campaign"
    page.should have_content("Create a Campaign")
    current_path.should == new_campaign_path
  end

end
