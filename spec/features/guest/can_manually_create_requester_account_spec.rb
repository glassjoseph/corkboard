require 'rails_helper'

RSpec.describe "Guest Bcrypt Authentication Process" do
  it "guest can create an account" do
    visit '/'

    click_on "Sign Up"
    expect(current_path).to eq('/choose-account')
    click_on "Sign Up To Hire"

    fill_in "user[first_name]", with: "Arnold"
    fill_in "user[last_name]", with: "Schwarzenegger"
    fill_in "user[phone_number]", with: "8675309"
    fill_in "user[zipcode]", with: "79720"
    fill_in "user[email]", with: "arny22@gmail.com"
    fill_in "user[password]", with: "hunter2"
    fill_in "user[password_confirmation]", with: "hunter2"



    click_on "Create Account"

    expect(current_path).to eq(twilio_confirmation_path)

    last_message = FakeSMS.messages.last

    fill_in "code_verification[code]", with: last_message.body

    click_on "Verify"

    expect(current_path).to eq(dashboard_path)



    latest_user = User.last

    expect(latest_user.first_name).to eq("Arnold")
    expect(latest_user.email).to eq("arny22@gmail.com")
  end
end
