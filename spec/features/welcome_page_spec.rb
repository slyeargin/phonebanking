feature "Welcome Page" do
  scenario "is displayed when loading the site" do
    visit '/'
    expect(page).to have_content("Welcome to Remote Phonebanking")
  end
end
