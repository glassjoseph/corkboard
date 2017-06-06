require 'rails_helper'

RSpec.describe 'NEED API TO BE BELOW LIMIT a logged pro can see available projects that match its services' do
  let!(:project_2_email) { project_2.requester.email }
  let!(:project_1_email) { project_1.requester.email }
  let!(:pro) { create(:pro_user, pro_service: pro_service) }
  let!(:pro_service) { create(:pro_service, service_ids: [service_1.id]) }
  let!(:project_1) { create(:project, service: service_1) }
  let!(:project_2) { create(:project, service: service_2) }
  let!(:service_1) { create(:service, category: category) }
  let!(:service_2) { create(:service, name: 'Gardening', category: category) }
  let!(:category)  { create(:category, name: 'Lawn & Garden', industry: industry) }
  let!(:industry)  { create(:industry, name: 'Home Improvement')}

  it 'visits find new projects page and and sees a list of projects that match services' do
    page.set_rack_session(user_id: pro.id, authenticated: true)
    visit '/pro/dashboard'

    click_link 'Find Open Projects'

    expect(current_path).to eq('/pro_dashboard/open_projects')

    expect(page).to have_content(project_1_email)
    expect(page).to have_content(project_1.service.name)
    expect(page).to have_content(project_1.created_at)
    expect(page).to have_content(project_1.timeline)
    expect(page).to have_content(project_1.recurring)

    expect(page).to_not have_content(project_2_email)
    expect(page).to_not have_content(project_2.service.name)
  end
end
