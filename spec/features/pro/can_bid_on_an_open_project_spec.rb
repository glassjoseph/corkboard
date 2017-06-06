require 'rails_helper'

RSpec.describe 'a logged-in pro can place a bid on an open project' do
  let!(:pro) { create(:pro_user, pro_service: pro_service) }
  let!(:pro_service) { create(:pro_service, service_ids: [service.id] )}
  let!(:project) { create(:project, service: service) }
  let!(:service) { create(:service, category: category) }
  let!(:category)  { create(:category, name: 'Lawn & Garden', industry: industry) }
  let!(:industry)  { create(:industry, name: 'Home Improvement')}

  xit "will let the pro place a bid" do
    page.set_rack_session(user_id: pro.id, authenticated: true)

    visit pro_dashboard_open_projects_path

    click_on "View"

    expect(current_path).to eq(pro_dashboard_open_project_path(project))

    fill_in "bid[amount]", with: "100"
    fill_in "bid[comment]", with: "I'd like to work on this project."

    click_on "Place Bid"

    expect(current_path).to eq(pro_dashboard_project_bids_path)

    bid = Bid.last
    
    expect(bid.amount).to eq("100")
    expect(bid.comment).to eq("I'd like to work on this project.")
    expect(bid.status).to eq("open")
  end
  
  it "charges a pro's credit card before placing a bid" do
    page.set_rack_session(user_id: pro.id, authenticated: true)

    bid = Bid.last
    
    visit new_bids_payment_path
    
    fill_in "Email", with: "wayne@aol.com"
    fill_in "Card Number", with: "4242424242424242"
    fill_in "MM/YY", with: "01/24"
    fill_in "CVC", with: "123"
    
    click_button "Submit Payment"

    expect(current_path).to eq(pro_dashboard_project_bids_path)

  end
end
