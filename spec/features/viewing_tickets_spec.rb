require "rails_helper"

RSpec.feature "user can view tickets" do
  it ", for a given project" do
    project = FactoryBot.create(:project, name: "Project one")
    FactoryBot.create(:ticket, project: project, name: "Ticket one", description: "Ticket one desc")

    visit "/"
    click_link "Project one"
    expect(page).to have_content "Ticket one"
  end
end
