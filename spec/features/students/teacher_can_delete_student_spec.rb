require 'rails_helper'

describe "teacher can visit student show page" do
  it "and delete a student" do
    teacher = Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "password")
    section = teacher.sections.create(name: "Literacy")
    student = section.students.create(first_name: "johnny", last_name: "smith")
    observation = student.observations.create(date: "05-02-2004", content: "This is my content", teacher: "Jane Doe")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(teacher)

    visit student_path(student)
    click_on "Delete Student"

    expect(current_path).to eq(teacher_path(teacher))
  end
end
