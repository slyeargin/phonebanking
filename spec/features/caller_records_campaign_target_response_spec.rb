require 'pry'

feature "View a target" do

  background do
    @presidentialprimary = Fabricate(:campaign, name: "Presidential Primary", summary: "It's where you pick your party's candidate.")
    @camacho = Fabricate(:target, first_name: "President", last_name: "Camacho", phone_number: "5555551234", zipcode: "37206", campaign: @presidentialprimary)
  end

  scenario "Happy Path, caller answers" do
    visit campaign_target_path(@presidentialprimary, @camacho)
    page.should have_content("President Camacho")
    current_path.should == campaign_target_path(@presidentialprimary, @camacho)
    choose('target_has_been_called_true')
    choose('target_responses_attributes_0_answer_true')
    click_button "Save Response"
    current_path.should == campaign_path(@presidentialprimary)
    @camacho.responses.count.should == 1
    # puts @camacho.responses.question
    @awareness = Response.where(target_id: @camacho.id).first
    @awareness.question.should == "Was the target aware?"
    @camacho.has_been_called.should == true
  end

end
