require 'rails_helper'

describe "User visits teachers index page" do
  context "as admin" do
    it "and adds new teacher" do
	   admin = Teacher.create(first_name: "Sara", last_name: "Smith", username: "ssmith23", password: "123", role: 1)
     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

     visit admin_teachers_path
     click_on "Add New Teacher"
     fill_in "teacher[first_name]", with: "Jane"
     fill_in "teacher[last_name]", with: "Doe"
     fill_in "teacher[username]", with: "jdoe23"
     fill_in "teacher[password]", with: "123"
     click_on "Create or Update Account"

     expect(current_path).to eq(admin_teachers_path)
     expect(page).to have_content("Jane Doe")
    end
  end
end
