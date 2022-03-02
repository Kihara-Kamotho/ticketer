require "rails_helper"

RSpec.feature "user can create new project" do
  it "with valid attributes" do
    visit "/"

    click_link "new project"

    fill_in "Name", with: "Project one"
    fill_in "Description", with: "New project"
    click_button "Create Project"
  end
  # validations
  it "when provided with invalid attributes" do
    visit "/"

    click_link "new project"
    fill_in "Name", with: ""
    click_button "Create Project"

    expect(page).to have_content "Error"
  end
end
