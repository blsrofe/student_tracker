require 'rails_helper'

describe "Teacher can visit a student show page" do
  describe "and click on add observations" do
    describe "and fill out a new observation" do
      it "and is redirected to the show page for that observation" do
          teacher = Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "password")
          section = teacher.sections.create(name: "Literacy")
          student = section.students.create(first_name: "johnny", last_name: "smith")


          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(teacher)

          visit student_path(student)
          click_on "Add Observation"

          expect(current_path).to eq(new_student_observation_path(student))
          fill_in "observation[date]", with: "3/4/15"
          fill_in "observation[content]", with: "This is content"
          fill_in "observation[teacher]", with: "Jane Doe"
          click_on "Create Observation"

          expect(current_path).to eq(student_observation_path(student, Observation.last))
          expect(page).to have_content("Jane Doe")
      end
    end
  end
end
