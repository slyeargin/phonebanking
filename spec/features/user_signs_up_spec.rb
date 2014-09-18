feature "User signs up" do

  scenario "Successful sign up and subsequent sign in" do
    visit '/'
    click_link "Sign up"
    expect(current_path).to eq new_user_registration_path
    Capybara.exact = true
    fill_in "* Email", with: "presidentcamacho@whitehouse.gov"
    fill_in "* Password", with: "electrolytes"
    fill_in "* Password confirmation", with: "electrolytes"
    Capybara.exact = false
    click_button "Sign up"
    expect(page).to have_content("Logged in as presidentcamacho@whitehouse.gov")
    expect(page).not_to have_link("Sign up")
    expect(page).not_to have_link("Sign in")

    user = User.last
    expect(user.email).to eq "presidentcamacho@whitehouse.gov"
    click_link "Logout"
    click_on "Login"
    fill_in "Email", with: "presidentcamacho@whitehouse.gov"
    fill_in "Password", with: "electrolytes"
    click_on "Sign in"
    expect(page).to have_content("Logged in as presidentcamacho@whitehouse.gov")
  end

  scenario "Skipped email and password" do
    visit '/'
    click_link "Sign up"
    click_button "Sign up"
    expect(page).to have_content("Please review the problems below")
    expect(page).to have_error("can't be blank", on: "Email")
    expect(page).to have_error("can't be blank", on: "Password")
  end

  scenario "Skipped password confirmation" do
    visit '/'
    click_link "Sign up"
    expect(current_path).to eq new_user_registration_path
    Capybara.exact = true
    fill_in "* Email", with: "presidentcamacho@whitehouse.gov"
    fill_in "* Password", with: "electrolytes"
    Capybara.exact = false
    click_button "Sign up"
    expect(page).to have_error("doesn't match Password", on: "Password confirmation")
  end

end
