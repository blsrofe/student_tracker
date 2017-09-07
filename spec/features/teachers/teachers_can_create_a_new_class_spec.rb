require 'rails_helper'

RSpec.describe "teacher can create a new class" do
  context "teacher goes to their show page" do
    context "and clicks on create new class" do
      it "fills out information and is redirected to the class show page" do
        teacher = Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "password")

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(teacher)

        visit teacher_path(teacher)
        click_on "Add New Class"
        expect(current_path).to eq(new_teacher_section_path(Teacher.first))
        fill_in "section[name]", with: "Literacy"
        click_on "Create Class"

        #expect(current_path).to eq(teacher_group_path(Teacher.first, Group.first))
        expect(page).to have_content("Literacy")
      end
    end
  end
end
