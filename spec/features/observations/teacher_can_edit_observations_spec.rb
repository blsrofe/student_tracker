require "rails_helper"

describe "teacher can visit the observation show page" do
  it "and edit an observation" do
    teacher = Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "password")
    section = teacher.sections.create(name: "Literacy")
    student = section.students.create(first_name: "johnny", last_name: "smith")
    observation = student.observations.create(date: "05-02-2004", content: "This is my content", teacher: "Jane Doe")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(teacher)

    visit student_observation_path(student, observation)
    click_on "Edit this observation"

    fill_in "observation[content]", with: "something new"
    click_on "Update Observation"

    expect(current_path).to eq(student_observation_path(student, observation))
    expect(page).to have_content("something new")
    expect(page).to have_no_content("This is my content")
  end
end
