require 'rails_helper'

describe "User visits teachers show page" do
  context "as admin" do
    it "and deletes teacher profile" do
	   admin = Teacher.create(first_name: "Sara", last_name: "Smith", username: "ssmith23", password: "123", role: 1)
     teacher = Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "123", role: 0)
     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

     visit admin_teacher_path(teacher)
     click_on "Delete Teacher Profile"

     expect(current_path).to eq(admin_teachers_path)
     expect(page).to have_no_content("Jane Doe")
    end
  end
end
