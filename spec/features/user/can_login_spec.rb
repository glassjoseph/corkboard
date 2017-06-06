require 'rails_helper'

RSpec.describe "User can login with form" do

let!(:user) { create(:user) }

  it "user can login" do

    visit login_path
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: "hunter2"

    click_on "Login"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logout")
  end
end
