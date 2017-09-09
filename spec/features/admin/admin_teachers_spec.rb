require 'rails_helper'

describe "User visits teachers index page" do
  context "as admin" do
    it "allows admin to see all teachers" do
	   admin = Teacher.create(first_name: "Sara", last_name: "Smith", username: "ssmith23", password: "123", role: 1)
     teacher = Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "123")
     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

     visit admin_teachers_path

     expect(page).to have_content("Jane Doe")
    end
  end

  context "as default user" do
    it "does not allow default user to see admin students index" do
      teacher = Teacher.create(first_name: "Sara", last_name: "Smith", username: "ssmith23", password: "123", role: 0)
      Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "123")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(teacher)

      visit admin_teachers_path

      expect(page).to_not have_content("Jane Doe")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
