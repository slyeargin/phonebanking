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

  scenario "Happy Path, caller answers" do
    visit campaign_target_path(@presidentialprimary, @camacho)
    page.should have_content("President Camacho")
    current_path.should == campaign_target_path(@presidentialprimary, @camacho)
    choose('target_has_been_called_true')
    choose('target_responses_attributes_0_answer_true')
    choose('target_responses_attributes_1_answer_true')
    click_button "Save Response"
    current_path.should == campaign_path(@presidentialprimary)
    @camacho.reload.has_been_called.should == true
    @camacho.responses.count.should == 2
    @awareness = Response.where(target_id: @camacho.id).first
    @awareness.question.should == "Was the target aware?"
  end

end
