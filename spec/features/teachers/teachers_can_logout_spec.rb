require 'rails_helper'

RSpec.describe "teacher can logout" do
  context "teacher clicks on logout button from show page" do
    it "is redirected to welcome page" do
      teacher = Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "password")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(teacher)

      visit teacher_path(teacher)

      page.first(:link, "Logout").click
      
      expect(current_path).to eq(root_path)
    end
  end
end
