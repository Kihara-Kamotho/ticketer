require "rails_helper"

RSpec.feature "user can edit existing project" do
  before do
    FactoryBot.create(:project, name: "project one") # note: this name set the name to be clicked as link

    visit "/"
    click_link "project one" # expects name to be eq to name set by FactoryBot, redirect_to show page
    click_link "Edit project"
  end

  # scenario 1
  it "with valid attributes" do

    fill_in "Name", with: "Updating name"
    click_button "Update Project"

    expect(page).to have_content "Project has been updated"
    expect(page).to have_content "Updating name"
  end

  #scenario 2
  it "when provided with invalid attributes"do
    fill_in "Name", with: ""
    click_button "Update Project"

    expect(page).to have_content "Project failed to update"
  end
end
