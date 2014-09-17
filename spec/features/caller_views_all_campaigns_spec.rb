feature "Viewing campaigns" do
  scenario "Happy Path" do
    pending "implementation"
    visit '/'
    click_on "View Campaigns"
    page.should have_content("Your Campaigns")
    current_path.should == campaigns_path
  end

end
