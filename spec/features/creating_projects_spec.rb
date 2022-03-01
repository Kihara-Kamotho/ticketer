require "rails_helper"

RSpec.feature "user can create new project" do
  it "with valid attributes" do
    visit "/"

    click_link "new project"

    fill_in "Name", with: "Project one"
    fill_in "Description", with: "New project"
    click_button "create project"
  end
  # validations
  it "when provided with invalid attributes" do
    visit "/"

    click_link "new project"
    click_button "create project"

    expect(page).to have_content "Name can`t be blank"
  end
end
