require "rails_helper"

describe "teacher can visit the student show page" do
  it "and edit a student" do
    teacher = Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "password")
    section = teacher.sections.create(name: "Literacy")
    student = section.students.create(first_name: "johnny", last_name: "smith")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(teacher)

    visit student_path(student)
    click_on "Edit Student"

    fill_in "student[first_name]", with: "adam"
    click_on "Update Student"

    expect(current_path).to eq(student_path(student))
    expect(page).to have_content("adam")
    expect(page).to have_no_content("johnny")
  end
end
