require "rails_helper"

RSpec.feature "user can delete a project" do
  it "successfully" do
    FactoryBot.create(:project, name: "Project one")

    visit "/"
    click_link "Project one" # redirects_to show page
    click_link "Delete Project"

    expect(page).to have_content "Project has been deleted"
    # expect(page.current_url).to eq projects_url
  end
end
