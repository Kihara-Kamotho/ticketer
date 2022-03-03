require "rails_helper"

RSpec.feature "user can create tickets to a project" do
  it "with valid attributes" do
    project = FactoryBot.create(:project, name: "Project one")

    visit project_path(project)
    click_link "New Ticket"

    fill_in "Name", with: "Project one"
    fill_in "Description", with: "Project one description"

    click_button "Create Ticket"
    expect(page).to have_content "Ticket created successfully"
  end

  it ", with invalid attributes" do
    project = FactoryBot.create(:project, name: "Project one")

    visit project_path(project)
    click_link "New Ticket"
    fill_in "Name", with: ""
    fill_in "Description", with: ""

    click_button "Create Ticket"
    expect(page).to have_content "Ticket not created"
  end
end
