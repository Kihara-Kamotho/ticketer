require "rails_helper"

RSpec.feature "user can view project" do
  it "with project details" do
    project = FactoryBot.create(:project, name: "Visual studio code")

    visit "/"
    click_link "Visual studio code"
    
    expect(page.current_url).to eq project_url(project)
  end
end
