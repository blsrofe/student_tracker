require 'rails_helper'

RSpec.describe "user can create a new teacher profile" do
  context "user visits root page and clicks on register" do
    context "user fills out new teacher info" do
      it "user is redirected to their show page" do


          visit '/'
          click_on "Register New Teacher"

          expect(current_path).to eq(new_teacher_path)
          fill_in "teacher[first_name]", with: "Jane"
          fill_in "teacher[last_name]", with: "Doe"
          fill_in "teacher[username]", with: "jdoe23"
          fill_in "teacher[password]", with: "password"
          click_on "Create New Account"

          expect(current_path).to eq(teacher_path(Teacher.first))
          expect(page).to have_content("Welcome, Jane")
        end
      end
    end
  end
