feature "View a target" do

  background do
    @user = Fabricate(:user)
    visit '/'
    click_link 'Login'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_on 'Sign in'
    @presidentialprimary = Fabricate(:campaign, name: "Presidential Primary", summary: "It's where you pick your party's candidate.")
    @caller = Fabricate(:caller, campaign_id: @presidentialprimary.id, user_id: @user.id)
    @camacho = Fabricate(:target, first_name: "President", last_name: "Camacho", phone_number: "5555551234", zipcode: "37206", campaign: @presidentialprimary)
  end

  scenario "Happy Path" do
    visit campaign_target_path(@presidentialprimary, @camacho)
    current_path.should == campaign_target_path(@presidentialprimary, @camacho)
    page.should have_content("President Camacho")
  end

end
