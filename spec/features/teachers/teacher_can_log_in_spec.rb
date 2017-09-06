require 'rails_helper'

RSpec.describe "User can login to teacher account" do
  context "teacher visits welcome page and selects login" do
    context "enters valid username and password" do
      it "is taken to their show page" do
        teacher = Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "password")

        visit '/'
        click_on "Login"

        expect(current_path).to eq(login_path)
        fill_in "session[username]", with: "jdoe23"
        fill_in "session[password]", with: "password"
        click_on "Login"

        expect(current_path).to eq(teacher_path(teacher))
        expect(page).to have_content("Welcome, Jane")
      end
    end
  end
end
