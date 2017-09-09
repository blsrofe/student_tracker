require "rails_helper"

describe "teacher can visit the section show page" do
  it "and edit a section" do
    teacher = Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "password")
    section = teacher.sections.create(name: "Literacy")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(teacher)

    visit section_path(section)
    click_on "Edit Class"

    fill_in "section[name]", with: "math"
    click_on "Create or Update Class"

    expect(current_path).to eq(section_path(section))
    expect(page).to have_content("math")
    expect(page).to have_no_content("Literacy")
  end
end
