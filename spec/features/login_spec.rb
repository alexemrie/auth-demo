require "rails_helper"

feature "user can login" do
  scenario "existing user can log into the site" do
    user = User.create(name: "andrew", password: "password")
    visit root_path

    fill_in "Name", with: "andrew"
    fill_in "Password", with: "password"

    click_on "Sign In"

    expect(page).to have_content "Thanks for signing in!"
  end
end
