require "rails_helper"

describe "A teacher can visit their class show page" do
  it "and add new students to a class" do
    teacher = Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "password")
    section = teacher.sections.create(name: "Literacy")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(teacher)

    visit section_path(section)
    click_on "Add Student"

    expect(current_path).to eq(new_section_student_path(section))
    fill_in "student[first_name]", with: "Johnny"
    fill_in "student[last_name]", with: "Smith"
    click_on "Create Student"
    expect(current_path).to eq(section_path(section))
    expect(page).to have_content("Johnny Smith")

  end
end
