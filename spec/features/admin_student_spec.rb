require 'rails_helper'

describe "User visits students index page" do
  context "as admin" do
    it "allows admin to see all students" do
	   admin = Teacher.create(first_name: "Sara", last_name: "Smith", username: "ssmith23", password: "123", role: 1)
     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

     visit admin_students_path

     expect(page).to have_content("Students")
    end
  end

  context "as default user" do
    it "does not allow default user to see admin students index" do
      teacher = Teacher.create(first_name: "Sara", last_name: "Smith", username: "ssmith23", password: "123", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(teacher)

      visit admin_students_path

      expect(page).to_not have_content("Students")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
