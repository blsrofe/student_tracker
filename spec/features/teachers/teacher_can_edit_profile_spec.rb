require 'rails_helper'

xdescribe "a logged in teacher " do
  describe "views their show page" do
    describe "clicks on edit account" do
      describe "changes information" do
        it "and is redirected back to their show page" do
          teacher = Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "password")
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(teacher)

          visit teacher_path(teacher)
          click_on "Edit Account"
          fill_in "teacher[first_name]", with: "jill"
          fill_in "teacher[password]", with: "123"
          click_on "Create or Update Account"

          expect(page).to have_content("jill")
          expect(page).to have_no_content("Jane")
        end
      end
    end
  end
end
