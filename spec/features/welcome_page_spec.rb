feature "Welcome Page" do
  scenario "is displayed when loading the site" do
    visit '/'
    expect(page).to have_content("You’re riding Ruby on Rails!")
  end
end
